variable "cg_name" {
  type        = string
  default     = "mysonarcube"
  description = "Specifies the name of the Container Registry."
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Container Group."
}

variable "rg_location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "ss_name" {
  type        = string
  description = "The Azure storage share that is to be mounted as a volume."
}

variable "sa_name" {
  type        = string
  description = "The Azure storage account from which the volume is to be mounted."
}

variable "sa_key" {
  type        = string
  description = "The access key for the Azure Storage account specified as above."
}

variable "cg_tags" {
  type        = map(string)
  default     = { "Environment" : "Prod", "Service" : "Auto" }
  description = "Container Group tags"

  validation {
    condition     = length(var.cg_tags) > 0
    error_message = "A mapping of tags to assign to the resource."
  }
}
