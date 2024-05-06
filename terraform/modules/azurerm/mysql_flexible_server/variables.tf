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

variable "mysql_tags" {
  type        = map(string)
  default     = { "Environment" : "Prod", "Service" : "Auto" }
  description = "A mapping of tags to assign to the MySQL."

  validation {
    condition     = length(var.mysql_tags) > 0
    error_message = "Tags must contain more than 1 value."
  }
}
