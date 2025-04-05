provider "azurerm" {
  features {}
  # ARM_SUBSCRIPTION_ID = ""
}

run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "main" {
  variables {
    resource_group_name       = "tapf-test${run.setup.test_id}-rg"
    function_app_name         = "tapf-test${run.setup.test_id}-func"
    storage_account_name      = "tapftest${run.setup.test_id}storage"
    log_analytics_name        = "tapf-test${run.setup.test_id}-law"
    app_service_plan_name     = "tapf-test${run.setup.test_id}-asp"
    application_insights_name = "tapf-test${run.setup.test_id}-ai"
    key_vault_name            = "tapf-test${run.setup.test_id}-kv"

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
