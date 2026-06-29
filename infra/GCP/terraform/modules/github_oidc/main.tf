terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

# ---------------------------------------------------------------------------
# Workload Identity Federation: GitHub Actions OIDC -> GCP, no service-account
# keys. The provider trusts only this repo; the SA binding narrows to the exact
# subject (environment / branch).
# ---------------------------------------------------------------------------
resource "google_iam_workload_identity_pool" "github" {
  project                   = var.project_id
  workload_identity_pool_id = var.pool_id
  display_name              = "GitHub Actions"
  description               = "OIDC federation for GitHub Actions deploys"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = "GitHub"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    "attribute.ref"        = "assertion.ref"
  }

  # Only tokens from this repository can use the provider.
  attribute_condition = "assertion.repository == \"${var.github_org}/${var.github_repo}\""

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account" "github" {
  project      = var.project_id
  account_id   = var.service_account_id
  display_name = "GitHub Actions deploy (${var.github_repo})"
}

# Bind the SA to the exact OIDC subject (e.g. environment:Prod / a branch ref).
resource "google_service_account_iam_member" "wif" {
  service_account_id = google_service_account.github.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/subject/repo:${var.github_org}/${var.github_repo}:${var.github_subject_claim}"
}

# ---------------------------------------------------------------------------
# Least-privilege deploy permissions
# ---------------------------------------------------------------------------
# Sync the built site into the bucket.
resource "google_storage_bucket_iam_member" "deploy" {
  bucket = var.bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.github.email}"
}

# Custom role with just the CDN cache-invalidation permissions (tighter than
# the broad roles/compute.loadBalancerAdmin).
resource "google_project_iam_custom_role" "cdn_invalidate" {
  project     = var.project_id
  role_id     = var.cdn_role_id
  title       = "Portfolio CDN Cache Invalidate"
  description = "Invalidate Cloud CDN cache on a URL map."
  permissions = [
    "compute.urlMaps.get",
    "compute.urlMaps.invalidateCache",
  ]
}

resource "google_project_iam_member" "cdn_invalidate" {
  project = var.project_id
  role    = google_project_iam_custom_role.cdn_invalidate.id
  member  = "serviceAccount:${google_service_account.github.email}"
}

# Read the deploy secret.
resource "google_secret_manager_secret_iam_member" "deploy" {
  project   = var.project_id
  secret_id = var.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.github.email}"
}
