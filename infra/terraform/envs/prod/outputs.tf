output "cloudfront_url" {
  description = "CloudFront distribution URL"
  value       = module.web_app.cloudfront_url
}

output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.web_app.distribution_id
}

output "s3_bucket_name" {
  description = "Origin S3 bucket name"
  value       = module.web_app.bucket_name
}

output "secret_arn" {
  description = "SECRETS_MANAGER_ARN GitHub secret value"
  value       = module.web_app.secret_arn
}

output "github_actions_role_arn" {
  description = "AWS_DEPLOY_ARN GitHub secret value"
  value       = module.github_oidc.role_arn
}
