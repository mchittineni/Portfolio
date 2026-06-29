variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region for all resources (keep us-east-1 if WAF/custom domain are enabled)."
}

variable "bucket_name" {
  type        = string
  description = "Globally-unique S3 bucket name for the dev site origin."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to assume the dev deploy role."
}
