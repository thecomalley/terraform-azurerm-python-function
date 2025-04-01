provider "azurerm" {
  features {}
  # ARM_SUBSCRIPTION_ID = ""
}

run "main" {
  variables {
    resource_group_name       = "tapf-test-rg"
    function_app_name         = "tapf-test-func"
    storage_account_name      = "tapfteststorage"
    log_analytics_name        = "tapf-test-law"
    app_service_plan_name     = "tapf-test-asp"
    application_insights_name = "tapf-test-ai"
    key_vault_name            = "tapf-test-kv"

    python_version     = "3.11"
    python_source_code = "src"
  }
}

run "source_code_deployed" {
  command = plan

  module {
    source = "./tests/http"
  }

  variables {
    function_app_name   = run.main.function_app_name
    resource_group_name = run.main.resource_group_name
    endpoint            = run.main.default_hostname
  }

  assert {
    condition     = data.http.index.status_code == 200
    error_message = "Website responded with HTTP status ${data.http.index.status_code}"
  }
  assert {
    condition     = data.http.index.body == "Hello, terraform!"
    error_message = "Website responded with body ${data.http.index.body}"
  }
}
