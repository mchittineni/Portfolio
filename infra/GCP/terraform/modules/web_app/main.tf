terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

locals {
  has_domain = var.domain_name != ""

  # Same allowlist as the AWS/Azure edges: Google Fonts + brand-icon CDNs.
  csp = join(" ", [
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

  # Cloud CDN serves these on every response (backend-bucket custom headers).
  security_headers = [
    "Strict-Transport-Security: max-age=63072000; includeSubDomains; preload",
    "X-Content-Type-Options: nosniff",
    "X-Frame-Options: DENY",
    "Referrer-Policy: strict-origin-when-cross-origin",
    "Content-Security-Policy: ${local.csp}",
  ]
}

# ---------------------------------------------------------------------------
# Origin: Cloud Storage bucket (static website)
# ---------------------------------------------------------------------------
resource "google_storage_bucket" "site" {
  name                        = var.bucket_name
  project                     = var.project_id
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = false
  labels                      = var.labels

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      num_newer_versions = 3
    }
    action {
      type = "Delete"
    }
  }
}

# Cloud CDN backend buckets require objects to be publicly readable. Toggle off
# if an org policy (iam.allowedPolicyMemberDomains) blocks allUsers.
resource "google_storage_bucket_iam_member" "public" {
  count  = var.public_bucket ? 1 : 0
  bucket = google_storage_bucket.site.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# ---------------------------------------------------------------------------
# Edge: global external Application Load Balancer + Cloud CDN
# ---------------------------------------------------------------------------
resource "google_compute_backend_bucket" "site" {
  name        = "${var.name_prefix}-backend"
  project     = var.project_id
  bucket_name = google_storage_bucket.site.name
  enable_cdn  = true

  # GCS-backed CDN can't use Cloud Armor (WAF), but it can still set response
  # security headers at the edge.
  custom_response_headers = local.security_headers

  cdn_policy {
    cache_mode        = "CACHE_ALL_STATIC"
    client_ttl        = 3600
    default_ttl       = 3600
    max_ttl           = 86400
    negative_caching  = true
    serve_while_stale = 86400
  }
}

resource "google_compute_global_address" "site" {
  name    = "${var.name_prefix}-ip"
  project = var.project_id
}

resource "google_compute_url_map" "site" {
  name            = "${var.name_prefix}-urlmap"
  project         = var.project_id
  default_service = google_compute_backend_bucket.site.id
}

# --- HTTPS path (only with a custom domain + Google-managed certificate) ---
resource "google_compute_managed_ssl_certificate" "site" {
  count   = local.has_domain ? 1 : 0
  name    = "${var.name_prefix}-cert"
  project = var.project_id

  managed {
    domains = [var.domain_name]
  }
}

resource "google_compute_target_https_proxy" "site" {
  count            = local.has_domain ? 1 : 0
  name             = "${var.name_prefix}-https-proxy"
  project          = var.project_id
  url_map          = google_compute_url_map.site.id
  ssl_certificates = [google_compute_managed_ssl_certificate.site[0].id]
}

resource "google_compute_global_forwarding_rule" "https" {
  count                 = local.has_domain ? 1 : 0
  name                  = "${var.name_prefix}-https"
  project               = var.project_id
  target                = google_compute_target_https_proxy.site[0].id
  ip_address            = google_compute_global_address.site.address
  port_range            = "443"
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

# --- HTTP path: redirect to HTTPS when a domain exists, else serve directly ---
resource "google_compute_url_map" "https_redirect" {
  count   = local.has_domain ? 1 : 0
  name    = "${var.name_prefix}-redirect"
  project = var.project_id

  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }
}

resource "google_compute_target_http_proxy" "site" {
  name    = "${var.name_prefix}-http-proxy"
  project = var.project_id
  url_map = local.has_domain ? google_compute_url_map.https_redirect[0].id : google_compute_url_map.site.id
}

resource "google_compute_global_forwarding_rule" "http" {
  name                  = "${var.name_prefix}-http"
  project               = var.project_id
  target                = google_compute_target_http_proxy.site.id
  ip_address            = google_compute_global_address.site.address
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL_MANAGED"
}

# ---------------------------------------------------------------------------
# Deploy secret: Secret Manager (analog to AWS Secrets Manager)
# ---------------------------------------------------------------------------
resource "google_secret_manager_secret" "deploy" {
  secret_id = var.secret_id
  project   = var.project_id
  labels    = var.labels

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "deploy" {
  secret = google_secret_manager_secret.deploy.id
  secret_data = jsonencode({
    bucket = google_storage_bucket.site.name
    urlMap = google_compute_url_map.site.name
  })
}
