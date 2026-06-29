variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region for all resources (keep us-east-1 if WAF/custom domain are enabled)."
}

variable "bucket_name" {
  type        = string
  description = "Globally-unique S3 bucket name for the prod site origin."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to assume the prod deploy role."
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "Optional custom domain (CNAME alias). Requires acm_certificate_arn."
}

variable "acm_certificate_arn" {
  type        = string
  default     = ""
  description = "Optional ACM certificate ARN in us-east-1 for the custom domain."
}
