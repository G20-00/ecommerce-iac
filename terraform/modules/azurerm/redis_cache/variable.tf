variable "rc_location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "rc_name" {
  type        = string
  default     = "redis-auto"
  description = "Specifies the name of the redis cache."
}

variable "rg_name" {
  type        = string
  description = "The name of the Resource Group in which to create the."
}

variable "rc_tags" {
  type        = map(string)
  default     = { "Environment" : "Prod", "Service" : "Auto" }
  description = "Redis cache tags"

  validation {
    condition     = length(var.rc_tags) > 0
    error_message = "A mapping of tags to assign to the resource."
  }
}