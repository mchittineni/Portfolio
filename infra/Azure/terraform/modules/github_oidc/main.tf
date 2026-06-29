terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

data "azuread_client_config" "current" {}

# ---------------------------------------------------------------------------
# Entra ID application + service principal assumed by GitHub Actions via OIDC.
# No long-lived client secret — auth is a short-lived federated token.
# ---------------------------------------------------------------------------
resource "azuread_application" "github" {
  display_name = var.application_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "github" {
  client_id = azuread_application.github.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_federated_identity_credential" "github" {
  application_id = azuread_application.github.id
  display_name   = var.credential_name
  description    = "GitHub Actions OIDC for ${var.github_org}/${var.github_repo}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${var.github_org}/${var.github_repo}:${var.github_subject_claim}"
}

# ---------------------------------------------------------------------------
# Least-privilege role assignments, scoped to the exact resources passed in.
# ---------------------------------------------------------------------------
# Sync the built site into the $web container.
resource "azurerm_role_assignment" "blob" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.github.object_id
}

# Purge the Front Door cache after a deploy.
resource "azurerm_role_assignment" "frontdoor" {
  scope                = var.frontdoor_profile_id
  role_definition_name = "CDN Profile Contributor"
  principal_id         = azuread_service_principal.github.object_id
}

# Read the deploy secret from Key Vault.
resource "azurerm_role_assignment" "key_vault" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azuread_service_principal.github.object_id
}
