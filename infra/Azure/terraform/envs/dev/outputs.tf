output "site_url" {
  description = "Public site URL served by Front Door"
  value       = module.web_app.site_url
}

output "storage_account_name" {
  description = "Origin storage account (deploy target for the $web container)"
  value       = module.web_app.storage_account_name
}

output "frontdoor_profile_name" {
  description = "Front Door profile name (for cache purge)"
  value       = module.web_app.frontdoor_profile_name
}

output "frontdoor_endpoint_name" {
  description = "Front Door endpoint name (for cache purge)"
  value       = module.web_app.frontdoor_endpoint_name
}

output "key_vault_name" {
  description = "Key Vault holding the deploy secret"
  value       = module.web_app.key_vault_name
}

output "azure_client_id" {
  description = "AZURE_CLIENT_ID GitHub secret value"
  value       = module.github_oidc.client_id
}

output "azure_tenant_id" {
  description = "AZURE_TENANT_ID GitHub secret value"
  value       = data.azurerm_client_config.current.tenant_id
}

output "azure_subscription_id" {
  description = "AZURE_SUBSCRIPTION_ID GitHub secret value"
  value       = data.azurerm_client_config.current.subscription_id
}
