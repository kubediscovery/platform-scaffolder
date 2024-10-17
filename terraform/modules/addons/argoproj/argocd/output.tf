output "initial_secret" {
  value       = base64encode(data.kubernetes_secret.argocd_server.data.password)
  description = "Initial password for the ArgoCD admin user"
  sensitive   = true
}

output "publish" {
  value = {
    "name"    = data.kubernetes_ingress_v1.argocd_server.spec == null ? [] : ""
    "address" = data.kubernetes_ingress_v1.argocd_server.status == null ? [] : ""
    "type"    = data.kubernetes_ingress_v1.argocd_server.status == null ? [] : ""
  }
  description = "External address to access the ArgoCD server"
  sensitive   = false
}

# output "publish" {
#   value = {
#     "name"    = data.kubernetes_ingress_v1.argocd_server.spec == null ? "" : data.kubernetes_ingress_v1.argocd_server.spec.0.rule.0.host
#     "address" = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : try(data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip)
#     "type"    = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : (data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname")
#   }
#   description = "External address to access the ArgoCD server"
#   sensitive   = false
# }