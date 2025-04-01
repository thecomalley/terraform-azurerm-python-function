
variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
  default     = "Australia East"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the service plan."
  type        = string
}

variable "log_analytics_name" {
  description = "The name of the log analytics workspace."
  type        = string
}

variable "application_insights_name" {
  description = "The name of the application insights."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the key vault."
  type        = string
}

variable "function_app_name" {
  description = "The name of the function app."
  type        = string
}
