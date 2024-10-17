# locals {
#   publish = [{
#     "name"    = data.kubernetes_ingress_v1.kong_manager.spec == null ? "" : data.kubernetes_ingress_v1.kong_manager.spec.0.rule.0.host
#     "address" = data.kubernetes_ingress_v1.kong_manager.status == null ? "" : try(data.kubernetes_ingress_v1.kong_manager.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_manager.status.0.load_balancer.0.ingress.0.ip)
#     "type"    = data.kubernetes_ingress_v1.kong_manager.status == null ? "" : data.kubernetes_ingress_v1.kong_manager.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
#     },
#     {
#       "name"    = data.kubernetes_ingress_v1.kong_portal.spec == null ? "" : data.kubernetes_ingress_v1.kong_portal.spec.0.rule.0.host
#       "address" = data.kubernetes_ingress_v1.kong_portal.status == null ? "" : try(data.kubernetes_ingress_v1.kong_portal.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_portal.status.0.load_balancer.0.ingress.0.ip)
#       "type"    = data.kubernetes_ingress_v1.kong_portal.status == null ? "" : data.kubernetes_ingress_v1.kong_portal.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
#     },
#     {
#       "name"    = data.kubernetes_ingress_v1.kong_portalapi.spec == null ? "" : data.kubernetes_ingress_v1.kong_portalapi.spec.0.rule.0.host
#       "address" = data.kubernetes_ingress_v1.kong_portalapi.status == null ? "" : try(data.kubernetes_ingress_v1.kong_portalapi.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_portalapi.status.0.load_balancer.0.ingress.0.ip)
#       "type"    = data.kubernetes_ingress_v1.kong_portalapi.status == null ? "" : data.kubernetes_ingress_v1.kong_portalapi.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
#     },
#     {
#       "name"    = data.kubernetes_ingress_v1.kong_admin.spec == null ? "" : data.kubernetes_ingress_v1.kong_admin.spec.0.rule.0.host
#       "address" = data.kubernetes_ingress_v1.kong_admin.status == null ? "" : try(data.kubernetes_ingress_v1.kong_admin.status.0.load_balancer.0.ingress.0.hostname, data.kubernetes_ingress_v1.kong_admin.status.0.load_balancer.0.ingress.0.ip)
#       "type"    = data.kubernetes_ingress_v1.kong_admin.status == null ? "" : data.kubernetes_ingress_v1.kong_admin.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
#   }]
# }