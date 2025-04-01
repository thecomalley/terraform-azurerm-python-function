variable "endpoint" {
  type = string
}

variable "function_app_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}


data "azurerm_function_app_host_keys" "test" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
}

data "http" "index" {
  url    = "${var.endpoint}/api/req?code=${data.azurerm_function_app_host_keys.test.primary_key}&user=terraform"
  method = "GET"

  request_headers = {
    "Accept" = "application/json"
  }

  request_body = jsonencode({
    "user" = "terraform"
  })
}

output "body" {
  value = data.http.index.body
}


output "satus_code" {
  value = data.http.index.status_code
}
