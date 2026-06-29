variable "application_name" {
  type        = string
  default     = "github-actions-portfolio"
  description = "Display name of the Entra ID application GitHub Actions authenticates as."
}

variable "credential_name" {
  type        = string
  default     = "github-actions"
  description = "Name of the federated identity credential."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to assume the identity."
}

variable "github_subject_claim" {
  type        = string
  default     = "environment:Prod"
  description = "OIDC subject suffix to trust. e.g. 'environment:Prod' or 'ref:refs/heads/develop'."
}

variable "storage_account_id" {
  type        = string
  description = "Resource ID of the storage account the identity may write to."
}

variable "frontdoor_profile_id" {
  type        = string
  description = "Resource ID of the Front Door profile the identity may purge."
}

variable "key_vault_id" {
  type        = string
  description = "Resource ID of the Key Vault holding the deploy secret."
}
