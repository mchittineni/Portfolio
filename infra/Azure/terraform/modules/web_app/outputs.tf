output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "Origin storage account name (deploy target for the $web container)"
  value       = azurerm_storage_account.site.name
}

output "storage_account_id" {
  description = "Origin storage account resource ID"
  value       = azurerm_storage_account.site.id
}

output "static_website_host" {
  description = "Storage static-website endpoint host"
  value       = azurerm_storage_account.site.primary_web_host
}

output "frontdoor_profile_id" {
  description = "Front Door profile resource ID"
  value       = azurerm_cdn_frontdoor_profile.this.id
}

output "frontdoor_profile_name" {
  description = "Front Door profile name (for `az afd endpoint purge`)"
  value       = azurerm_cdn_frontdoor_profile.this.name
}

output "frontdoor_endpoint_name" {
  description = "Front Door endpoint name (for `az afd endpoint purge`)"
  value       = azurerm_cdn_frontdoor_endpoint.this.name
}

output "site_url" {
  description = "Public site URL served by Front Door"
  value       = "https://${azurerm_cdn_frontdoor_endpoint.this.host_name}"
}

output "key_vault_id" {
  description = "Key Vault resource ID holding the deploy secret"
  value       = azurerm_key_vault.this.id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.this.name
}
