variable "bucket_name" {
  type        = string
  description = "Globally-unique S3 bucket name for the site origin (3-63 chars, lowercase)."

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "bucket_name must be 3-63 chars: lowercase letters, numbers, hyphens, dots."
  }
}

variable "secret_name" {
  type        = string
  default     = "PortfolioSecret"
  description = "Secrets Manager secret name. Drives the deploy workflow's env-var prefix (PORTFOLIOSECRET_...)."
}

variable "enable_waf" {
  type        = bool
  default     = true
  description = "Attach an AWS-managed WAFv2 WebACL to the distribution (requires the provider to be in us-east-1)."
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "Optional custom domain (CNAME alias). Requires acm_certificate_arn."
}

variable "acm_certificate_arn" {
  type        = string
  default     = ""
  description = "Optional ACM certificate ARN in us-east-1 for the custom domain. Required if domain_name is set."
}
