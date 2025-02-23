variable "rg_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Network Interface."
}

variable "rg_location" {
  type        = string
  description = "The location where the Network Interface should exist."
}

variable "sn_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in."
}

variable "ni_name" {
  type        = string
  default     = "ni-ecommerce"
  description = "The name of the Network Interface."
}

variable "ni_ip_name" {
  type        = string
  default     = "Internal"
  description = "A name used for this IP Configuration."
}

variable "privip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "The allocation method used for the Private IP Address."
}

variable "ni_tags" {
  type        = map(string)
  default     = { "Environment" : "Prod", "Service" : "Auto" }
  description = "Network Interface tags"

  validation {
    condition     = length(var.ni_tags) > 0
    error_message = "A mapping of tags to assign to the resource."
  }
}
