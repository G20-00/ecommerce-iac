resource "helm_release" "kp" {
  name       = var.kp_name
  namespace  = var.kp_namespace
  version    = var.kp_version
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  set {
    name  = "service.type"
    value = var.kp_type
  }
}
