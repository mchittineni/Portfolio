terraform {
  # Isolated prod state. Replace the bucket with your Terraform state bucket, then
  #   terraform init
  # (uses S3-native state locking; no DynamoDB table required on Terraform >= 1.10).
  backend "s3" {
    bucket       = "REPLACE-with-your-tf-state-bucket"
    key          = "portfolio/prod/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
