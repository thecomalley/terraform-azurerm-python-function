terraform {
  required_version = "~> 1.11" # Write-only attributes are only supported in Terraform 1.11 and later (azurerm_key_vault_secret)
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23" # azurerm_key_vault_secret - resource now supports the value_wo write-only argument (#28947)
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}
