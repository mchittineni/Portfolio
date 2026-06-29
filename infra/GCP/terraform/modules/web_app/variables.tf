variable "project_id" {
  type        = string
  description = "GCP project ID to deploy into."
}

variable "name_prefix" {
  type        = string
  default     = "portfolio"
  description = "Prefix for load-balancer resource names (backend, url maps, proxies, IP)."
}

variable "bucket_name" {
  type        = string
  description = "Globally-unique Cloud Storage bucket name for the site origin."

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9._-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must be 3-63 chars: lowercase letters, numbers, hyphens, underscores, dots."
  }
}

variable "location" {
  type        = string
  default     = "US"
  description = "Bucket location (region or multi-region, e.g. US, EU, us-central1)."
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "Optional custom domain. When set, provisions an HTTPS LB with a Google-managed certificate and HTTP->HTTPS redirect; otherwise the LB serves over HTTP only."
}

variable "public_bucket" {
  type        = bool
  default     = true
  description = "Grant allUsers objectViewer so Cloud CDN can serve the bucket. Disable if an org policy forbids public members."
}

variable "secret_id" {
  type        = string
  default     = "portfolio-deploy"
  description = "Secret Manager secret ID holding the deploy metadata (bucket + url map)."
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "Labels applied to the bucket and secret (keys/values must be lowercase)."
}
