variable "rg_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet."
}

variable "snet_name" {
  type        = string
  default     = "snet-ecommerce"
  description = "The name of the subnet."
}

variable "snet_address_prefixes" {
  type        = string
  default     = "10.0.1.0/24"
  description = "The address prefixes to use for the subnet."
}

variable "subnet_delegation" {
  type = list(object({
    name = string
    service_delegation = list(object({
      name    = string
      actions = list(string)
    }))
  }))
  description = "Delegation configuration for the subnet"
  default = []
}
