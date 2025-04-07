resource "azurerm_key_vault" "main" {
  name                       = var.key_vault_name
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  sku_name                   = "standard"
  enable_rbac_authorization  = true
  tags                       = var.tags
}

locals {
  secret_environment_variables = {
    for secret in var.secret_environment_variables : secret => lower(replace(secret, "_", "-"))
  }
}

resource "azurerm_key_vault_secret" "main" {
  for_each         = local.secret_environment_variables
  name             = each.value
  value_wo         = "update-me-in-the-portal"
  value_wo_version = "1.0"
  key_vault_id     = azurerm_key_vault.main.id
  content_type     = "${var.function_app_name} environment variable: ${each.key}"

  depends_on = [
    azurerm_role_assignment.terraform,
  ]
}

# grant deployment user access to the key vault
resource "azurerm_role_assignment" "terraform" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

# grant function app access to the key vault
resource "azurerm_role_assignment" "main" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_function_app.main.identity[0].principal_id
}

