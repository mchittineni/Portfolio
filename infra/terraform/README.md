# Infrastructure — Terraform

A Terraform implementation of the portfolio's AWS infrastructure, **functionally
equivalent to the CloudFormation templates** in the parent directory. Reusable
**modules** are composed by per-**environment** stacks (dev/prod), each with its
own isolated remote state.

> Pick **one** IaC tool as your source of truth (Terraform _or_ CloudFormation)
> — don't apply both against the same account/resources.

## Layout

```
infra/terraform/
├── modules/                  # Reusable building blocks
│   ├── web_app/              # S3 origin + OAC + CloudFront + WAF + headers + logs + KMS + secret
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── github_oidc/          # GitHub OIDC provider + least-privilege deploy role
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── envs/                     # One deployable stack per environment
    ├── dev/
    │   ├── backend.tf        # Isolated dev state (portfolio/dev/terraform.tfstate)
    │   ├── providers.tf      # aws provider + default_tags (Environment = Dev)
    │   ├── variables.tf
    │   ├── main.tf           # Calls the modules with dev parameters
    │   ├── outputs.tf
    │   └── terraform.tfvars.example
    └── prod/                 # Same shape, prod parameters
        └── ...
```

> This project is **serverless/static** (S3 + CloudFront), so there is no VPC
> module — the building blocks that fit the architecture are `web_app` and
> `github_oidc`.

## Per-environment differences

|                    | dev                       | prod                  |
| ------------------ | ------------------------- | --------------------- |
| WAF (`enable_waf`) | off                       | on                    |
| Secret name        | `PortfolioSecret-dev`     | `PortfolioSecret`     |
| Deploy role        | `github_actions_role_dev` | `github_actions_role` |
| OIDC `sub` scope   | `ref:refs/heads/develop`  | `environment:Prod`    |
| Owns OIDC provider | no (reuses prod's)        | **yes**               |
| `Environment` tag  | `Dev`                     | `Prod`                |

The GitHub OIDC provider is **account-global** (one per account). The prod stack
creates it; dev reuses it via a data source. **Apply `prod` before `dev`**, or
create the provider once out of band and set `create_oidc_provider = false`
everywhere.

## Prerequisites

- Terraform >= 1.10 (for S3-native state locking), AWS credentials.
- An **S3 bucket for Terraform state** — put its name in each env's
  [`backend.tf`](envs/prod/backend.tf) (replace `REPLACE-with-your-tf-state-bucket`).
- Deploy in **`us-east-1`** when `enable_waf = true` or using a custom domain
  (CloudFront WAF + ACM must live in us-east-1).

## Usage

Each environment is applied independently from its own directory:

```bash
cd infra/terraform/envs/prod        # or envs/dev
cp terraform.tfvars.example terraform.tfvars   # then edit
terraform init
terraform plan
terraform apply
```

## Outputs → GitHub repository secrets

After `apply`, wire the outputs into the repo (Settings → Secrets and variables
→ Actions):

| GitHub secret         | Terraform output                             |
| --------------------- | -------------------------------------------- |
| `AWS_DEPLOY_ARN`      | `github_actions_role_arn`                    |
| `AWS_DEPLOY_REGION`   | the region you applied in (e.g. `us-east-1`) |
| `SECRETS_MANAGER_ARN` | `secret_arn`                                 |

Also create a **`Prod`** GitHub environment (prod's role trust defaults to
`environment:Prod`). Then run the **Deploy Website (Prod)** workflow. See the
[deploy details and secret→env mapping](../README.md#how-the-deploy-secret-feeds-the-workflow)
in the CloudFormation guide.

## What `web_app` creates

Private, versioned, SSE S3 origin (all public access blocked) → CloudFront with
Origin Access Control, Managed-CachingOptimized cache policy, a security
response-headers policy (HSTS/preload, X-Content-Type-Options, frame-deny,
referrer policy), `403/404 → /404.html`, optional WAFv2 (AWS managed rule
groups), a dedicated access-log bucket, and a KMS-encrypted Secrets Manager
secret holding the distribution id + bucket name the deploy workflow reads.

`github_oidc` creates the GitHub OIDC provider (optional) and an IAM role whose
inline policy is scoped to the exact bucket/distribution/secret/key the
`web_app` module produced — tighter than the CloudFormation template's `*`
defaults.

## State

Each env uses an isolated S3 state key (`portfolio/<env>/terraform.tfstate`) with
S3-native locking (`use_lockfile = true`, no DynamoDB table needed). The
`.terraform.lock.hcl` provider lockfiles **are** committed; `.terraform/` and
`*.tfstate*` are git-ignored.

## Teardown

Empty both buckets first (the origin bucket is versioned — delete all versions):

```bash
aws s3 rm s3://<bucket> --recursive
aws s3 rm s3://<bucket>-cf-logs --recursive
terraform destroy        # from the env directory
```
