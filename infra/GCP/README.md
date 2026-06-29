# Infrastructure — GCP (Terraform)

Hosts the static site on a **Cloud Storage** bucket served through a **global
external Application Load Balancer + Cloud CDN**, with edge security headers, a
**Secret Manager** deploy secret, and **keyless Workload Identity Federation**
for GitHub Actions. Mirrors the [AWS Terraform](../AWS/terraform/README.md) layout.

## Layout

```
terraform/
├── modules/
│   ├── web_app/       # bucket (static website), backend bucket + Cloud CDN,
│   │                  # global IP, URL map, HTTP(S) proxies + forwarding rules,
│   │                  # managed cert (with a domain), Secret Manager secret
│   └── github_oidc/   # Workload Identity Pool + provider + service account,
│                      # least-priv IAM (storage.objectAdmin, a custom CDN
│                      # cache-invalidate role, secretmanager.secretAccessor)
└── envs/
    ├── dev/           # HTTP-only LB, branch-scoped binding
    └── prod/          # optional managed-cert HTTPS LB, environment-scoped
```

## Per-environment differences

| Setting      | dev                      | prod                                    |
| ------------ | ------------------------ | --------------------------------------- |
| HTTPS        | HTTP-only (no domain)    | managed cert + HTTP→HTTPS (with domain) |
| OIDC subject | `ref:refs/heads/develop` | `environment:Prod`                      |
| Labels       | `environment = dev`      | `environment = prod`                    |

## HTTPS & WAF notes

- A GCP external HTTPS LB needs a certificate, and Google-managed certs require a
  **domain you control**. With no `domain_name`, the LB serves over **HTTP**;
  set `domain_name` (prod) to provision the managed-cert HTTPS LB + redirect.
- **WAF:** Cloud Armor attaches to backend _services_, not backend _buckets_, so
  the GCS-backed CDN here has no managed WAF. Security headers (incl. CSP) are
  still applied via backend-bucket custom response headers.

## Prerequisites

- Terraform ≥ 1.10, gcloud authenticated (`gcloud auth application-default login`)
- A project with billing + the Compute, Storage, IAM, and Secret Manager APIs enabled
- A versioned GCS bucket for remote state (fill in `backend.tf`)

## Usage

```bash
cd terraform/envs/prod          # or envs/dev
cp terraform.tfvars.example terraform.tfvars   # fill in project/bucket/names
terraform init                  # configure backend.tf first
terraform plan -out=tfplan
terraform apply tfplan
```

## Outputs → GitHub repository secrets / variables

| Output                           | GitHub                                  |
| -------------------------------- | --------------------------------------- |
| `gcp_workload_identity_provider` | secret `GCP_WORKLOAD_IDENTITY_PROVIDER` |
| `gcp_service_account`            | secret `GCP_SERVICE_ACCOUNT`            |
| `project_id` (your tfvars)       | variable `GCP_PROJECT`                  |

The deploy workflow reads `bucket` / `urlMap` from the `portfolio-deploy` Secret
Manager secret at run time.

## Teardown

```bash
terraform destroy
```
