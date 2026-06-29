variable "subscription_id" {
  type        = string
  description = "Azure subscription ID to deploy into."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure region for the resource group and storage account."
}

variable "resource_group_name" {
  type        = string
  default     = "portfolio-prod-rg"
  description = "Resource group name for the prod stack."
}

variable "storage_account_name" {
  type        = string
  description = "Globally-unique storage account name for the prod site origin (3-24 lowercase alphanumerics)."
}

variable "key_vault_name" {
  type        = string
  description = "Globally-unique Key Vault name for the prod deploy secret."
}

variable "github_org" {
  type        = string
  description = "GitHub organization or user that owns the repository."
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name allowed to assume the prod deploy identity."
}
