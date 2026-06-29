variable "project_id" {
  type        = string
  description = "GCP project ID."
}

variable "pool_id" {
  type        = string
  default     = "github-actions"
  description = "Workload Identity Pool ID."
}

variable "provider_id" {
  type        = string
  default     = "github"
  description = "Workload Identity Pool Provider ID."
}

variable "service_account_id" {
  type        = string
  default     = "github-actions-deploy"
  description = "Service account ID (the part before @project.iam.gserviceaccount.com)."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to impersonate the service account."
}

variable "github_subject_claim" {
  type        = string
  default     = "environment:Prod"
  description = "OIDC subject suffix to trust. e.g. 'environment:Prod' or 'ref:refs/heads/develop'."
}

variable "cdn_role_id" {
  type        = string
  default     = "portfolioCdnInvalidate"
  description = "Project-level custom role ID for CDN cache invalidation (must be unique per project)."
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket the service account may write to."
}

variable "secret_id" {
  type        = string
  description = "Secret Manager secret ID the service account may read."
}
