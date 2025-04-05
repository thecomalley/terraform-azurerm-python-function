data "azurerm_client_config" "current" {}

data "archive_file" "azure_function" {
  type             = "zip"
  source_dir       = var.python_source_code
  output_file_mode = "0666"
  output_path      = "${path.module}/zipdeploy/function.zip"
  excludes = concat(var.python_source_code_excludes, [
    ".venv",
    ".git",
    ".gitignore",
    "__pycache__",
    ".DS_Store",
  ])
}
