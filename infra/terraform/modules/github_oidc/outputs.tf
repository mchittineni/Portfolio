output "role_arn" {
  description = "IAM role ARN GitHub Actions assumes (set as the AWS_DEPLOY_ARN GitHub secret)"
  value       = aws_iam_role.github_actions.arn
}

output "role_name" {
  description = "IAM role name"
  value       = aws_iam_role.github_actions.name
}

output "oidc_provider_arn" {
  description = "ARN of the GitHub OIDC provider in use"
  value       = local.oidc_provider_arn
}
