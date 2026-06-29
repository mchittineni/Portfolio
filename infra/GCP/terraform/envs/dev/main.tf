# Dev deployment — branch-scoped Workload Identity binding
# (repo:.../...:ref:refs/heads/develop). HTTP-only LB (no domain).

locals {
  labels = {
    environment = "dev"
    team        = "mc"
    project     = "portfolio-project"
    managed-by  = "terraform"
  }
}

module "web_app" {
  source = "../../modules/web_app"

  project_id  = var.project_id
  name_prefix = "portfolio-dev"
  bucket_name = var.bucket_name
  location    = var.location
  labels      = local.labels
}

module "github_oidc" {
  source = "../../modules/github_oidc"

  project_id           = var.project_id
  pool_id              = "github-actions-dev"
  provider_id          = "github"
  service_account_id   = "gha-deploy-dev"
  cdn_role_id          = "portfolioCdnInvalidateDev"
  github_org           = var.github_org
  github_repo          = var.github_repo
  github_subject_claim = "ref:refs/heads/develop"

  bucket_name = module.web_app.bucket_name
  secret_id   = module.web_app.secret_id
}
