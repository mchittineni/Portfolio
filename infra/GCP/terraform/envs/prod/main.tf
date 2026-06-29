# Prod deployment — environment-scoped Workload Identity binding
# (repo:.../...:environment:Prod). Add a domain to enable the managed-cert HTTPS LB.

locals {
  labels = {
    environment = "prod"
    team        = "mc"
    project     = "portfolio-project"
    managed-by  = "terraform"
  }
}

module "web_app" {
  source = "../../modules/web_app"

  project_id  = var.project_id
  name_prefix = "portfolio-prod"
  bucket_name = var.bucket_name
  location    = var.location
  domain_name = var.domain_name
  labels      = local.labels
}

module "github_oidc" {
  source = "../../modules/github_oidc"

  project_id           = var.project_id
  pool_id              = "github-actions-prod"
  provider_id          = "github"
  service_account_id   = "gha-deploy-prod"
  cdn_role_id          = "portfolioCdnInvalidateProd"
  github_org           = var.github_org
  github_repo          = var.github_repo
  github_subject_claim = "environment:Prod"

  bucket_name = module.web_app.bucket_name
  secret_id   = module.web_app.secret_id
}
