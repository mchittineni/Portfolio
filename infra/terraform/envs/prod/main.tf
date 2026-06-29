# Prod deployment — WAF on, environment-scoped deploy role, and owner of the
# account-global GitHub OIDC provider (the dev env reuses it).

module "web_app" {
  source = "../../modules/web_app"

  bucket_name         = var.bucket_name
  secret_name         = "PortfolioSecret"
  enable_waf          = true
  domain_name         = var.domain_name
  acm_certificate_arn = var.acm_certificate_arn
}

module "github_oidc" {
  source = "../../modules/github_oidc"

  role_name            = "github_actions_role"
  github_org           = var.github_org
  github_repo          = var.github_repo
  github_subject_claim = "environment:Prod"
  create_oidc_provider = true # owns the account-global provider

  deploy_bucket_arn = module.web_app.bucket_arn
  distribution_arn  = module.web_app.distribution_arn
  secret_arn        = module.web_app.secret_arn
  kms_key_arn       = module.web_app.kms_key_arn
}
