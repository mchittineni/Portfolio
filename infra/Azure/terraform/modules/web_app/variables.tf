variable "resource_group_name" {
  type        = string
  description = "Resource group that holds all portfolio resources."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure region for the resource group and storage account."
}

variable "storage_account_name" {
  type        = string
  description = "Globally-unique storage account name (3-24 chars, lowercase letters and digits)."

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "storage_account_name must be 3-24 chars: lowercase letters and digits only."
  }
}

variable "key_vault_name" {
  type        = string
  description = "Globally-unique Key Vault name (3-24 chars, alphanumerics and hyphens, start with a letter)."

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9-]{1,22}[a-zA-Z0-9]$", var.key_vault_name))
    error_message = "key_vault_name must be 3-24 chars, start with a letter, contain only letters/digits/hyphens."
  }
}

variable "enable_waf" {
  type        = bool
  default     = true
  description = "Provision a Premium Front Door with the Microsoft-managed WAF. When false, uses Standard (no managed WAF)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all taggable resources."
}
