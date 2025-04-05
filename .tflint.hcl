config {
  force               = true
  module              = true
  disabled_by_default = false
}

plugin "azurerm" {
    enabled = true
    version = "0.28.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
