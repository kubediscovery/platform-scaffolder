output "ingress" {
  value = helm_release.ingress
}

output "external_address" {
  value = {
    "address" = data.kubernetes_service.ingress.status.0.load_balancer.0.ingress.0.hostname != "" ? data.kubernetes_service.ingress.status.0.load_balancer.0.ingress.0.hostname : data.kubernetes_service.ingress.status.0.load_balancer.0.ingress.0.ip
    "type"    = data.kubernetes_service.ingress.status.0.load_balancer.0.ingress.0.hostname != "" ? "hostname" : "ip"
  }
}