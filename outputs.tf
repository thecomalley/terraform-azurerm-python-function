output "function_app_name" {
  description = "The name of the Linux Function App"
  value       = azurerm_linux_function_app.main.name
}

output "function_app_id" {
  description = "The ID of the Linux Function App"
  value       = azurerm_linux_function_app.main.id
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "default_hostname" {
  description = "The default hostname of the Linux Function App"
  value       = azurerm_linux_function_app.main.default_hostname
}

output "principal_id" {
  description = "The identity of the Linux Function App"
  value       = azurerm_linux_function_app.main.identity[0].principal_id
}
