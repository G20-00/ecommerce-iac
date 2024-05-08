variable "kp_name" {
  type        = string
  default     = "prometheus-auto"
  description = "Specifies the name of the Prometheus Helm release."
}

variable "kp_namespace" {
  type        = string
  default     = "kube-public"
  description = "Specifies the Kubernetes namespace in which to deploy the Helm chart."
}

variable "kp_version" {
  type        = string
  default     = "36.2.0"
  description = "Specifies the version of the Helm chart to deploy."
}

variable "kp_type" {
  type        = string
  default     = "LoadBalancer"
  description = "Specifies the type of service to create."
}
