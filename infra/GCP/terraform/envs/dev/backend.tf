terraform {
  # Isolated dev state in a GCS bucket. Create the state bucket first (enable
  # versioning), fill in the name below, then `terraform init`.
  backend "gcs" {
    bucket = "REPLACE-with-your-tfstate-bucket"
    prefix = "portfolio/dev"
  }
}
