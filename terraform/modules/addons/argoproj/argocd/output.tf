output "argocd" {
  value       = helm_release.argocd
  sensitive   = true
  description = "Result of installation a ArgoCD"
}

output "service" {
  value = data.kubernetes_service.argocd_server
}

output "secret" {
  value = data.kubernetes_secret.argocd_server
}

output "ep" {
  value = data.kubernetes_endpoints_v1.argocd_server
}

output "external_address" {
  value = {
    "address"    = data.kubernetes_ingress_v1.argocd_server.status.loadbalancer.ingress.0.hostname 
  }
}