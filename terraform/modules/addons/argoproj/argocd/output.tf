output "initial_secret" {
  value = data.kubernetes_secret.argocd_server.data.password
}

output "external_address" {
  value = {
    "hostname" = data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.hostname
    "ip" = data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip
  }
}