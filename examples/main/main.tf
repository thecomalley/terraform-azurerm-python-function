module "terraform_azurerm_python_function" {
  source = "../../"

  location = "Australia East"

  resource_group_name       = "tapf-example-rg"
  function_app_name         = "tapf-example-func"
  storage_account_name      = "tapfexamplestorage"
  log_analytics_name        = "tapf-example-law"
  app_service_plan_name     = "tapf-example-asp"
  application_insights_name = "tapf-example-ai"
  key_vault_name            = "tapf-example-kv"

  python_version = "3.11"

  # must be a relative path to ${path.module}
  python_source_code = "src"

  environment_variables = {
    EXAMPLE_ENV_1 = "example_value_1"
    EXAMPLE_ENV_2 = "example_value_2"
  }

  secret_environment_variables = [
    "EXAMPLE_SECRET_1",
    "EXAMPLE_SECRET_2",
  ]
}
