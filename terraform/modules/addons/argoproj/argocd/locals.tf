locals {
   publish = {
    "record_name"    = data.kubernetes_ingress_v1.argocd_server.spec == null ? "" : data.kubernetes_ingress_v1.argocd_server.spec.0.rule.0.host
    "record_address" = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : try(data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip)
    "record_type"    = data.kubernetes_ingress_v1.argocd_server.status == null ? "" : data.kubernetes_ingress_v1.argocd_server.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  }
}
