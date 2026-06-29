# Infrastructure

Three **independent, equivalent** hosting stacks for the static site — pick one,
or publish to several at once with the toggles in
[`deploy_prod.yml`](../.github/workflows/deploy_prod.yml). Every stack is private
origin → CDN → edge security headers, with **keyless GitHub OIDC** deploys.

```
infra/
├── AWS/          # CloudFormation + Terraform — S3 + CloudFront + WAFv2
│   ├── cloudformation/   app_infra.yml, github_actions_role.yml
│   └── terraform/        modules/{web_app,github_oidc} + envs/{dev,prod}
├── Azure/        # Terraform — Storage static site + Front Door
│   └── terraform/        modules/{web_app,github_oidc} + envs/{dev,prod}
└── GCP/          # Terraform — Cloud Storage + Cloud CDN + HTTPS LB
    └── terraform/        modules/{web_app,github_oidc} + envs/{dev,prod}
```

All three Terraform layouts share the same shape: reusable `web_app` +
`github_oidc` modules, composed by isolated `envs/dev` and `envs/prod` (separate
state, prod = hardened/WAF, dev = cheaper/branch-scoped).

## What each cloud provisions

| Concern          | AWS                           | Azure                         | GCP                                 |
| ---------------- | ----------------------------- | ----------------------------- | ----------------------------------- |
| Origin           | Private S3 (OAC)              | Storage Account `$web`        | Cloud Storage bucket                |
| CDN / TLS        | CloudFront                    | Front Door                    | Global external ALB + Cloud CDN     |
| WAF              | WAFv2 managed rules           | Front Door WAF (Premium)      | _n/a on bucket backends_ (see note) |
| Security headers | Response-headers policy + CSP | Front Door rule set + CSP     | Backend-bucket custom headers + CSP |
| Deploy secret    | Secrets Manager + KMS         | Key Vault                     | Secret Manager                      |
| Keyless deploy   | IAM OIDC role                 | Entra ID federated credential | Workload Identity Federation        |

> **GCP WAF note:** Cloud Armor attaches to backend _services_, not backend
> _buckets_, so a pure GCS-backed CDN can't run a managed WAF. Security response
> headers (incl. CSP) are still applied at the edge. For WAF, front the site
> with a serverless NEG (Cloud Run) backend service.

## Deploy identity → GitHub secrets / variables

`deploy_prod.yml` builds once and fans out to the clouds you enable. Each cloud
authenticates via OIDC (no stored keys) and reads its resource names from the
deploy secret it provisioned. Set these from the matching `terraform output`:

| Cloud | GitHub **secrets**                                            | GitHub **variables** | Terraform outputs                                                               |
| ----- | ------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------------------- |
| AWS   | `AWS_DEPLOY_ARN`, `AWS_DEPLOY_REGION`, `SECRETS_MANAGER_ARN`  | —                    | `github_actions_role_arn`, `secret_arn`                                         |
| Azure | `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` | `AZURE_KEY_VAULT`    | `azure_client_id`, `azure_tenant_id`, `azure_subscription_id`, `key_vault_name` |
| GCP   | `GCP_WORKLOAD_IDENTITY_PROVIDER`, `GCP_SERVICE_ACCOUNT`       | `GCP_PROJECT`        | `gcp_workload_identity_provider`, `gcp_service_account`                         |

The repo must define a **`Prod`** GitHub environment (each deploy job runs in it,
and every OIDC trust is scoped to `environment:Prod`).

## Per-cloud docs

- [AWS](AWS/README.md) · [AWS Terraform](AWS/terraform/README.md)
- [Azure Terraform](Azure/README.md)
- [GCP Terraform](GCP/README.md)
