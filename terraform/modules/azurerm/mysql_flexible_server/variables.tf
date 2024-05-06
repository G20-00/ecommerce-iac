variable "rg_name" {
  type        = string
  description = "The name of the Resource Group in which to create the MySQL."
}

variable "rg_location" {
  type        = string
  description = "The location where the MySQL should exist."
}

variable "snet_id" {
  type        = string
  description = "The ID of the Subnet to which the MySQL should be delegated."
}
