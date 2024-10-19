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

output "gitops_source_repos_urls" {
  value = local.gitops_source_repos_urls
  description = "values for the gitops source repos urls"
  sensitive   = false
}

output "gitops_namespace" {
  value = helm_release.argocd.namespace
  description = "values for the gitops source repos urls"
  sensitive   = false
}