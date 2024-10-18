locals {
   publish = {
    "name"    = data.kubernetes_ingress_v1.argocd_server.spec == null ? "" : data.kubernetes_ingress_v1.argocd_server.spec.0.rule.0.host
    "address" = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : try(data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip)
    "type"    = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  }
}
