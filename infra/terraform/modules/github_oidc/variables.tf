variable "role_name" {
  type        = string
  default     = "github_actions_role"
  description = "Name of the IAM role GitHub Actions assumes. Must be unique per account."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to assume the role."
}

variable "github_subject_claim" {
  type        = string
  default     = "environment:Prod"
  description = "OIDC subject suffix the role trusts. e.g. 'environment:Prod', 'ref:refs/heads/main', or '*' (not recommended)."
}

variable "create_oidc_provider" {
  type        = bool
  default     = false
  description = "Create the account-global GitHub OIDC provider. Exactly one env should set this true; others reuse it."
}

variable "deploy_bucket_arn" {
  type        = string
  description = "ARN of the S3 bucket the role may write to."
}

variable "distribution_arn" {
  type        = string
  description = "ARN of the CloudFront distribution the role may invalidate."
}

variable "secret_arn" {
  type        = string
  description = "ARN of the Secrets Manager secret the role may read."
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of the KMS key the role may use to decrypt the secret."
}
