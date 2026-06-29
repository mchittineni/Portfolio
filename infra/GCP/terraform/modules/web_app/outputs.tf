output "bucket_name" {
  description = "Origin Cloud Storage bucket (deploy target)"
  value       = google_storage_bucket.site.name
}

output "backend_bucket_name" {
  description = "Cloud CDN backend bucket name"
  value       = google_compute_backend_bucket.site.name
}

output "url_map_name" {
  description = "URL map name (for `gcloud compute url-maps invalidate-cdn-cache`)"
  value       = google_compute_url_map.site.name
}

output "load_balancer_ip" {
  description = "Global anycast IP of the load balancer (point your DNS A record here)"
  value       = google_compute_global_address.site.address
}

output "site_url" {
  description = "Public site URL"
  value       = local.has_domain ? "https://${var.domain_name}" : "http://${google_compute_global_address.site.address}"
}

output "secret_id" {
  description = "Secret Manager secret ID holding the deploy metadata"
  value       = google_secret_manager_secret.deploy.secret_id
}

output "secret_name" {
  description = "Fully-qualified Secret Manager secret name"
  value       = google_secret_manager_secret.deploy.name
}
