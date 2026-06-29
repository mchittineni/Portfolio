output "bucket_name" {
  description = "Origin S3 bucket name"
  value       = aws_s3_bucket.site.id
}

output "bucket_arn" {
  description = "Origin S3 bucket ARN"
  value       = aws_s3_bucket.site.arn
}

output "logging_bucket_name" {
  description = "CloudFront access-log bucket name"
  value       = aws_s3_bucket.logs.id
}

output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.site.id
}

output "distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = aws_cloudfront_distribution.site.arn
}

output "distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_url" {
  description = "CloudFront distribution URL"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "secret_arn" {
  description = "Secrets Manager secret ARN"
  value       = aws_secretsmanager_secret.deploy.arn
}

output "kms_key_arn" {
  description = "KMS key ARN used to encrypt the deploy secret"
  value       = aws_kms_key.secret.arn
}
