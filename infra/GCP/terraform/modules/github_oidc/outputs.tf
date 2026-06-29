output "service_account_email" {
  description = "Deploy service account email — set as the GCP_SERVICE_ACCOUNT GitHub secret"
  value       = google_service_account.github.email
}

output "workload_identity_provider" {
  description = "Full provider resource name — set as the GCP_WORKLOAD_IDENTITY_PROVIDER GitHub secret"
  value       = google_iam_workload_identity_pool_provider.github.name
}

output "workload_identity_pool_name" {
  description = "Workload Identity Pool resource name"
  value       = google_iam_workload_identity_pool.github.name
}
