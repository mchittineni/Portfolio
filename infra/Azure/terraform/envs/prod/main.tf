# Prod deployment — Premium Front Door with the managed WAF, environment-scoped
# federated credential (repo:.../...:environment:Prod).

data "azurerm_client_config" "current" {}

locals {
  tags = {
    Environment = "Prod"
    Team        = "MC"
    Project     = "Portfolio-Project"
    ManagedBy   = "Terraform"
  }
}

module "web_app" {
  source = "../../modules/web_app"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  key_vault_name       = var.key_vault_name
  enable_waf           = true
  tags                 = local.tags
}

module "github_oidc" {
  source = "../../modules/github_oidc"

  application_name     = "github-actions-portfolio"
  credential_name      = "github-actions-prod"
  github_org           = var.github_org
  github_repo          = var.github_repo
  github_subject_claim = "environment:Prod"

  storage_account_id   = module.web_app.storage_account_id
  frontdoor_profile_id = module.web_app.frontdoor_profile_id
  key_vault_id         = module.web_app.key_vault_id
}
