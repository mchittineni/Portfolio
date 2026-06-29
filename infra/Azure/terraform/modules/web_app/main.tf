terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

data "azurerm_client_config" "current" {}

locals {
  # Premium is required for managed WAF rule sets; Standard is cheaper for dev.
  frontdoor_sku = var.enable_waf ? "Premium_AzureFrontDoor" : "Standard_AzureFrontDoor"

  # Same allowlist as the AWS CloudFront policy: Google Fonts + brand-icon CDNs.
  # 'unsafe-inline' covers Nuxt's inlined hydration script and scoped styles.
  csp = join(" ", [
    "default-src 'self';",
    "base-uri 'self';",
    "object-src 'none';",
    "frame-ancestors 'none';",
    "img-src 'self' data: https://cdn.jsdelivr.net https://www.vectorlogo.zone;",
    "font-src 'self' https://fonts.gstatic.com;",
    "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;",
    "script-src 'self' 'unsafe-inline';",
    "connect-src 'self';",
    "form-action 'self';",
    "upgrade-insecure-requests",
  ])
}

# ---------------------------------------------------------------------------
# Resource group
# ---------------------------------------------------------------------------
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# ---------------------------------------------------------------------------
# Origin: Storage Account static website ($web served over the web endpoint)
# ---------------------------------------------------------------------------
resource "azurerm_storage_account" "site" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false # $web still serves anonymously via the web endpoint
  tags                            = var.tags
}

resource "azurerm_storage_account_static_website" "site" {
  storage_account_id = azurerm_storage_account.site.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

# ---------------------------------------------------------------------------
# Edge: Azure Front Door (CDN + TLS + security headers, optional managed WAF)
# ---------------------------------------------------------------------------
resource "azurerm_cdn_frontdoor_profile" "this" {
  name                = "${var.resource_group_name}-fd"
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = local.frontdoor_sku
  tags                = var.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "this" {
  name                     = var.storage_account_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
  tags                     = var.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "this" {
  name                     = "portfolio-origin-group"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id

  load_balancing {
    sample_size                 = 4
    successful_samples_required = 3
  }

  health_probe {
    interval_in_seconds = 100
    path                = "/"
    protocol            = "Https"
    request_type        = "HEAD"
  }
}

resource "azurerm_cdn_frontdoor_origin" "site" {
  name                          = "portfolio-origin"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
  enabled                       = true

  certificate_name_check_enabled = true
  host_name                      = azurerm_storage_account.site.primary_web_host
  origin_host_header             = azurerm_storage_account.site.primary_web_host
  http_port                      = 80
  https_port                     = 443
  priority                       = 1
  weight                         = 1000
}

resource "azurerm_cdn_frontdoor_rule_set" "security" {
  name                     = "securityheaders"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
}

resource "azurerm_cdn_frontdoor_rule" "security_headers" {
  name                      = "securityheaders"
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.security.id
  order                     = 1
  behavior_on_match         = "Continue"

  actions {
    response_header_action {
      header_action = "Overwrite"
      header_name   = "Strict-Transport-Security"
      value         = "max-age=63072000; includeSubDomains; preload"
    }
    response_header_action {
      header_action = "Overwrite"
      header_name   = "X-Content-Type-Options"
      value         = "nosniff"
    }
    response_header_action {
      header_action = "Overwrite"
      header_name   = "X-Frame-Options"
      value         = "DENY"
    }
    response_header_action {
      header_action = "Overwrite"
      header_name   = "Referrer-Policy"
      value         = "strict-origin-when-cross-origin"
    }
    response_header_action {
      header_action = "Overwrite"
      header_name   = "Content-Security-Policy"
      value         = local.csp
    }
  }

  # Origin/origin-group must exist before the rule references the route graph.
  depends_on = [azurerm_cdn_frontdoor_origin.site]
}

resource "azurerm_cdn_frontdoor_route" "this" {
  name                          = "portfolio-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.this.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.this.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.site.id]
  cdn_frontdoor_rule_set_ids    = [azurerm_cdn_frontdoor_rule_set.security.id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  link_to_default_domain = true
}

# WAF — Microsoft-managed rule sets (Premium SKU only) -> conditional.
resource "azurerm_cdn_frontdoor_firewall_policy" "this" {
  count = var.enable_waf ? 1 : 0

  name                = "portfoliowaf"
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = azurerm_cdn_frontdoor_profile.this.sku_name
  enabled             = true
  mode                = "Prevention"
  tags                = var.tags

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "2.1"
    action  = "Block"
  }

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
    action  = "Block"
  }
}

resource "azurerm_cdn_frontdoor_security_policy" "this" {
  count = var.enable_waf ? 1 : 0

  name                     = "portfolio-security-policy"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.this[0].id

      association {
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_endpoint.this.id
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}

# ---------------------------------------------------------------------------
# Deploy secret: Key Vault (analog to AWS Secrets Manager + KMS)
# ---------------------------------------------------------------------------
resource "azurerm_key_vault" "this" {
  name                       = var.key_vault_name
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  rbac_authorization_enabled = true
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  tags                       = var.tags
}

# Allow the principal running Terraform to write the deploy secret (RBAC mode).
resource "azurerm_role_assignment" "kv_secrets_officer" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_secret" "deploy" {
  name         = "portfolio-deploy"
  key_vault_id = azurerm_key_vault.this.id
  value = jsonencode({
    storageAccount    = azurerm_storage_account.site.name
    resourceGroup     = azurerm_resource_group.this.name
    frontDoorProfile  = azurerm_cdn_frontdoor_profile.this.name
    frontDoorEndpoint = azurerm_cdn_frontdoor_endpoint.this.name
  })

  depends_on = [azurerm_role_assignment.kv_secrets_officer]
}
