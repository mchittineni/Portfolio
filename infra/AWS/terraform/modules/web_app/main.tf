terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
  }
}

data "aws_caller_identity" "current" {}

# Managed-CachingOptimized (same policy id used by the CloudFormation template).
data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

# ---------------------------------------------------------------------------
# Origin bucket (private)
# ---------------------------------------------------------------------------
resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
  tags   = { Name = "${var.bucket_name}-S3Bucket" }
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "site" {
  bucket = aws_s3_bucket.site.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "site" {
  bucket = aws_s3_bucket.site.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  rule {
    id     = "DeleteOldObjects"
    status = "Enabled"
    filter {}
    expiration {
      days = 365
    }
  }

  rule {
    id     = "ExpireNoncurrentVersions"
    status = "Enabled"
    filter {}
    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}

# CloudFront -> S3 via Origin Access Control (replaces the legacy OAI).
resource "aws_cloudfront_origin_access_control" "site" {
  name                              = "${var.bucket_name}-oac"
  description                       = "OAC for the portfolio CloudFront distribution"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

data "aws_iam_policy_document" "site_bucket" {
  statement {
    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.site.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.site.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id
  policy = data.aws_iam_policy_document.site_bucket.json
}

# ---------------------------------------------------------------------------
# CloudFront access-log bucket (ACLs enabled so CloudFront can deliver logs)
# ---------------------------------------------------------------------------
resource "aws_s3_bucket" "logs" {
  bucket = "${var.bucket_name}-cf-logs"
  tags   = { Name = "${var.bucket_name}-CFLoggingBucket" }
}

resource "aws_s3_bucket_ownership_controls" "logs" {
  bucket = aws_s3_bucket.logs.id
  rule {
    # CloudFront standard logging delivers via ACL grants, so ACLs must stay on.
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket                  = aws_s3_bucket.logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id
  rule {
    id     = "DeleteOldObjects"
    status = "Enabled"
    filter {}
    expiration {
      days = 365
    }
  }
}

# ---------------------------------------------------------------------------
# Security response headers
# ---------------------------------------------------------------------------
resource "aws_cloudfront_response_headers_policy" "security" {
  name    = "${var.bucket_name}-security-headers"
  comment = "Adds standard security headers to all responses."

  security_headers_config {
    strict_transport_security {
      access_control_max_age_sec = 63072000
      include_subdomains         = true
      preload                    = true
      override                   = true
    }
    content_type_options {
      override = true
    }
    frame_options {
      frame_option = "DENY"
      override     = true
    }
    referrer_policy {
      referrer_policy = "strict-origin-when-cross-origin"
      override        = true
    }
    xss_protection {
      protection = true
      mode_block = true
      override   = true
    }
    content_security_policy {
      # Allowlist only what the site loads: Google Fonts (CSS + font files) and
      # the brand-icon CDNs. 'unsafe-inline' is required for Nuxt's inlined
      # hydration script and scoped styles in the static build.
      content_security_policy = join(" ", [
        "default-src 'self';",
        "base-uri 'self';",
        "object-src 'none';",
        "frame-ancestors 'none';",
        "img-src 'self' data: https://cdn.jsdelivr.net https://www.vectorlogo.zone;",
        "font-src 'self' https://fonts.gstatic.com;",
        "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;",
        "script-src 'self' 'unsafe-inline';",
        "connect-src 'self';",
        "form-action 'self';",
        "upgrade-insecure-requests",
      ])
      override = true
    }
  }
}

# ---------------------------------------------------------------------------
# WAFv2 WebACL (CLOUDFRONT scope -> must be created in us-east-1)
# ---------------------------------------------------------------------------
resource "aws_wafv2_web_acl" "site" {
  count = var.enable_waf ? 1 : 0

  name        = "${var.bucket_name}-web-acl"
  description = "AWS managed protections for the portfolio CloudFront distribution"
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  visibility_config {
    sampled_requests_enabled   = true
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.bucket_name}-web-acl"
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 0
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesCommonRuleSet"
      }
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSet"
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 1
    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
      }
    }
    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSet"
    }
  }

  tags = { Name = "${var.bucket_name}-WebACL" }
}

# ---------------------------------------------------------------------------
# CloudFront distribution
# ---------------------------------------------------------------------------
resource "aws_cloudfront_distribution" "site" {
  enabled             = true
  default_root_object = "index.html"
  aliases             = var.domain_name != "" ? [var.domain_name] : []
  web_acl_id          = var.enable_waf ? aws_wafv2_web_acl.site[0].arn : null
  tags                = { Name = "${var.bucket_name}-CloudFront" }

  origin {
    domain_name              = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id                = "S3Origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.site.id
  }

  default_cache_behavior {
    target_origin_id           = "S3Origin"
    viewer_protocol_policy     = "redirect-to-https"
    allowed_methods            = ["GET", "HEAD"]
    cached_methods             = ["GET", "HEAD"]
    compress                   = true
    cache_policy_id            = data.aws_cloudfront_cache_policy.caching_optimized.id
    response_headers_policy_id = aws_cloudfront_response_headers_policy.security.id
  }

  # Private S3 returns 403 for missing keys; surface a real 404 instead of a 200.
  custom_error_response {
    error_code            = 403
    response_code         = 404
    response_page_path    = "/404.html"
    error_caching_min_ttl = 10
  }
  custom_error_response {
    error_code            = 404
    response_code         = 404
    response_page_path    = "/404.html"
    error_caching_min_ttl = 10
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.acm_certificate_arn == "" ? true : null
    acm_certificate_arn            = var.acm_certificate_arn != "" ? var.acm_certificate_arn : null
    ssl_support_method             = var.acm_certificate_arn != "" ? "sni-only" : null
    minimum_protocol_version       = var.acm_certificate_arn != "" ? "TLSv1.2_2021" : null
  }

  logging_config {
    bucket          = aws_s3_bucket.logs.bucket_domain_name
    include_cookies = false
    prefix          = "cloudfront-logs/"
  }
}

# ---------------------------------------------------------------------------
# KMS-encrypted deploy secret (distribution id + bucket name for the workflow)
# ---------------------------------------------------------------------------
resource "aws_kms_key" "secret" {
  description         = "KMS CMK for encrypting Secrets Manager secrets"
  enable_key_rotation = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
      Action    = "kms:*"
      Resource  = "*"
    }]
  })
}

resource "aws_kms_alias" "secret" {
  name          = "alias/${var.secret_name}"
  target_key_id = aws_kms_key.secret.key_id
}

resource "aws_secretsmanager_secret" "deploy" {
  name        = var.secret_name
  description = "Stores CloudFront Distribution ID and S3 Bucket name"
  kms_key_id  = aws_kms_key.secret.arn
  tags        = { Name = "${var.bucket_name}-SecretsManagerSecret" }
}

resource "aws_secretsmanager_secret_version" "deploy" {
  secret_id = aws_secretsmanager_secret.deploy.id
  secret_string = jsonencode({
    DistributionId = aws_cloudfront_distribution.site.id
    S3Bucket       = aws_s3_bucket.site.id
  })
}
