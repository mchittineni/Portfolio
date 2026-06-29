# Infrastructure — Azure (Terraform)

Hosts the static site on an **Azure Storage** static website fronted by **Azure
Front Door** (CDN + TLS + security headers, optional managed WAF), with a
**Key Vault** deploy secret and a **keyless** Entra ID federated credential for
GitHub Actions. Mirrors the [AWS Terraform](../AWS/terraform/README.md) layout.

## Layout

```
terraform/
├── modules/
│   ├── web_app/       # resource group, storage static website, Front Door
│   │                  # (endpoint, origin, route, security-headers rule set),
│   │                  # optional WAF policy, Key Vault + deploy secret
│   └── github_oidc/   # Entra ID app + SP + federated credential + role
│                      # assignments (Storage Blob Data Contributor, CDN
│                      # Profile Contributor, Key Vault Secrets User)
└── envs/
    ├── dev/           # Standard Front Door (no WAF), branch-scoped credential
    └── prod/          # Premium Front Door + managed WAF, environment-scoped
```

## Per-environment differences

| Setting        | dev                       | prod                  |
| -------------- | ------------------------- | --------------------- |
| Front Door SKU | Standard (no managed WAF) | Premium + managed WAF |
| OIDC subject   | `ref:refs/heads/develop`  | `environment:Prod`    |
| Tags           | `Environment = Dev`       | `Environment = Prod`  |

## Prerequisites

- Terraform ≥ 1.10, Azure CLI logged in (`az login`)
- A subscription you can create resources in
- An Azure Storage container for remote state (fill in `backend.tf`)

## Usage

```bash
cd terraform/envs/prod          # or envs/dev
cp terraform.tfvars.example terraform.tfvars   # fill in subscription/names
terraform init                  # configure backend.tf first
terraform plan -out=tfplan
terraform apply tfplan
```

## Outputs → GitHub repository secrets / variables

| Output                  | GitHub                         |
| ----------------------- | ------------------------------ |
| `azure_client_id`       | secret `AZURE_CLIENT_ID`       |
| `azure_tenant_id`       | secret `AZURE_TENANT_ID`       |
| `azure_subscription_id` | secret `AZURE_SUBSCRIPTION_ID` |
| `key_vault_name`        | variable `AZURE_KEY_VAULT`     |

The deploy workflow reads `storageAccount` / `resourceGroup` / `frontDoorProfile`
/ `frontDoorEndpoint` from the `portfolio-deploy` Key Vault secret at run time.

## Teardown

```bash
terraform destroy
```

> Key Vault has **purge protection** enabled — a destroyed vault is soft-deleted
> and its name is reserved until the retention window elapses (or you purge it).
