output "initial_secret" {
  value = data.kubernetes_secret.argocd_server.data.password
}

output "external_address" {
  value = {
    "hostname" = data.kubernetes_ingress_v1.argocd_server.spec.0.rules.0.host
  }
}