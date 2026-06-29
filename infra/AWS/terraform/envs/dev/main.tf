# Dev deployment — WAF off (cheaper), branch-scoped deploy role, reuses the
# account-global OIDC provider created by the prod env.

module "web_app" {
  source = "../../modules/web_app"

  bucket_name = var.bucket_name
  secret_name = "PortfolioSecret-dev"
  enable_waf  = false
}

module "github_oidc" {
  source = "../../modules/github_oidc"

  role_name            = "github_actions_role_dev"
  github_org           = var.github_org
  github_repo          = var.github_repo
  github_subject_claim = "ref:refs/heads/develop"
  create_oidc_provider = false # prod env owns the shared provider

  deploy_bucket_arn = module.web_app.bucket_arn
  distribution_arn  = module.web_app.distribution_arn
  secret_arn        = module.web_app.secret_arn
  kms_key_arn       = module.web_app.kms_key_arn
}
