output "site_url" {
  description = "Public site URL"
  value       = module.web_app.site_url
}

output "load_balancer_ip" {
  description = "Global anycast IP (point your DNS A record here)"
  value       = module.web_app.load_balancer_ip
}

output "bucket_name" {
  description = "Origin bucket (deploy target)"
  value       = module.web_app.bucket_name
}

output "url_map_name" {
  description = "URL map name (for cache invalidation)"
  value       = module.web_app.url_map_name
}

output "secret_id" {
  description = "Secret Manager secret ID holding deploy metadata"
  value       = module.web_app.secret_id
}

output "gcp_workload_identity_provider" {
  description = "GCP_WORKLOAD_IDENTITY_PROVIDER GitHub secret value"
  value       = module.github_oidc.workload_identity_provider
}

output "gcp_service_account" {
  description = "GCP_SERVICE_ACCOUNT GitHub secret value"
  value       = module.github_oidc.service_account_email
}
