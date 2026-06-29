# Dev deployment — Standard Front Door (WAF off, cheaper), branch-scoped
# federated credential (repo:.../...:ref:refs/heads/develop).

data "azurerm_client_config" "current" {}

locals {
  tags = {
    Environment = "Dev"
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
  enable_waf           = false
  tags                 = local.tags
}

module "github_oidc" {
  source = "../../modules/github_oidc"

  application_name     = "github-actions-portfolio-dev"
  credential_name      = "github-actions-dev"
  github_org           = var.github_org
  github_repo          = var.github_repo
  github_subject_claim = "ref:refs/heads/develop"

  storage_account_id   = module.web_app.storage_account_id
  frontdoor_profile_id = module.web_app.frontdoor_profile_id
  key_vault_id         = module.web_app.key_vault_id
}
