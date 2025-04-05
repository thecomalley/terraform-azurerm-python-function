variable "python_version" {
  description = "(Required) The version of Python to run. Possible values are 3.13, 3.12, 3.11, 3.10, 3.9, 3.8 and 3.7"
  type        = string
}

variable "python_source_code" {
  description = "(Required) The path to the Python source code."
  type        = string
}

variable "environment_variables" {
  type        = map(string)
  description = "(Optional) A map of environment variables to be passed to the function app."
  default     = {}
}

variable "secret_environment_variables" {
  type        = list(string)
  description = "(Optional) A list of secrets to be passed to the function app, you will need to set the values in the key vault."
  default     = []
}

variable "python_source_code_excludes" {
  type        = list(string)
  description = "(Optional) A list of files or directories to exclude from the source code zip file."
  default     = []
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
