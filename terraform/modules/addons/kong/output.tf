output "kong" {
  value = helm_release.kong
}

output "publish" {
  value = [{
    "name"    = data.kubernetes_ingress_v1.kong_manager.spec.0.rule.0.host
    "address" = try(data.kubernetes_ingress_v1.kong_manager.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_manager.status.0.load_balancer.0.ingress.0.ip)
    "type"    = data.kubernetes_ingress_v1.kong_manager.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  },
  {
    "name"    = data.kubernetes_ingress_v1.kong_portal.spec.0.rule.0.host
    "address" = try(data.kubernetes_ingress_v1.kong_portal.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_portal.status.0.load_balancer.0.ingress.0.ip)
    "type"    = data.kubernetes_ingress_v1.kong_portal.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  },
  {
    "name"    = data.kubernetes_ingress_v1.kong_portalapi.spec.0.rule.0.host
    "address" = try(data.kubernetes_ingress_v1.kong_portalapi.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_portalapi.status.0.load_balancer.0.ingress.0.ip)
    "type"    = data.kubernetes_ingress_v1.kong_portalapi.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  },
  {
    "name"    = data.kubernetes_ingress_v1.kong_admin.spec.0.rule.0.host
    "address" = try(data.kubernetes_ingress_v1.kong_admin.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_admin.status.0.load_balancer.0.ingress.0.ip)
    "type"    = data.kubernetes_ingress_v1.kong_admin.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  }]
  description = "External address to access Kong services (manager, portal, portalapi, admin)"
  sensitive   = false
}

