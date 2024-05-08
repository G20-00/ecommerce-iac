variable "rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Container Registry."
}

variable "rg_location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "sa_tags" {
  type        = map(string)
  default     = { "Environment" : "Prod", "Service" : "Auto" }
  description = "Storage Account tags"

  validation {
    condition     = length(var.sa_tags) > 0
    error_message = "A mapping of tags to assign to the resource."
  }
}
