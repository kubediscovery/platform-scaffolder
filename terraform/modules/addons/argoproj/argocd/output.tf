output "initial_secret" {
  value       = base64encode(data.kubernetes_secret.argocd_server.data.password)
  description = "Initial password for the ArgoCD admin user"
  sensitive   = true
}

output "publish" {
  value = local.publish
  description = "External address to access the ArgoCD server"
  sensitive   = false
}
