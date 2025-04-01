# http

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.25.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_function_app_host_keys.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/function_app_host_keys) | data source |
| [http_http.index](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_body"></a> [body](#output\_body) | n/a |
| <a name="output_satus_code"></a> [satus\_code](#output\_satus\_code) | n/a |
<!-- END_TF_DOCS -->
