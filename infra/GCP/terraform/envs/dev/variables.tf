variable "project_id" {
  type        = string
  description = "GCP project ID for the dev stack."
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Default provider region (the LB is global; this is for regional API calls)."
}

variable "bucket_name" {
  type        = string
  description = "Globally-unique Cloud Storage bucket name for the dev site origin."
}

variable "location" {
  type        = string
  default     = "US"
  description = "Bucket location (region or multi-region)."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to deploy."
}
