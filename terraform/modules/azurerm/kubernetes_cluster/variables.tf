variable "rg_name" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist."
}

variable "rg_location" {
  type        = string
  description = "The location where the Managed Kubernetes Cluster should be created."
}

variable "aks_name" {
  type        = string
  default     = "aks-ecommerce"
  description = "The name of the Managed Kubernetes Cluster to create."
}

variable "aks_dns_prefix" {
  type        = string
  default     = "aks-cluster"
  description = "DNS prefix specified when creating the managed cluster."
}

variable "aks_tags" {
  type        = map(string)
  default     = { "Environment" : "Production" }
  description = "A mapping of tags to assign to the resource."

  validation {
    condition     = length(var.aks_tags) > 0
    error_message = "Tags must contain more than 1 value."
  }
}
