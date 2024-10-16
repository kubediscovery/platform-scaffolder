output "initial_secret" {
  value = data.kubernetes_secret.argocd_server.data.password
}

output "external_address" {
  value = {
    "ingress" = data.kubernetes_ingress_v1.argocd_server.spec.0.rule
    "hostname" = data.kubernetes_ingress_v1.argocd_server.spec.0.rules.0.host
    "ip" = data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip
  }
}