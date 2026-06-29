terraform {
  # Isolated dev state in an Azure Storage container. Create the state storage
  # account/container first, fill in the names below, then `terraform init`.
  backend "azurerm" {
    resource_group_name  = "REPLACE-with-your-tfstate-rg"
    storage_account_name = "REPLACEtfstate"
    container_name       = "tfstate"
    key                  = "portfolio/dev/terraform.tfstate"
    use_azuread_auth     = true
  }
}
