locals {
  chart_name        = "keycloak"
  chart_version     = "24.0.1"
  release_name      = "keycloak"
  release_namespace = "platform-shared"

  publish = {
    "name"    = data.kubernetes_ingress_v1.keycloak.spec == null ? "" : data.kubernetes_ingress_v1.keycloak.spec.0.rule.0.host
    "address" = data.kubernetes_ingress_v1.keycloak.status == null ? "" : data.kubernetes_ingress_v1.keycloak.status.0.load_balancer.0.ingress.0.hostname != "" ? data.kubernetes_ingress_v1.keycloak.status.0.load_balancer.0.ingress.0.hostname : data.kubernetes_ingress_v1.keycloak.status.0.load_balancer.0.ingress.0.ip
    "type"    = data.kubernetes_ingress_v1.keycloak.status == null ? "" : data.kubernetes_ingress_v1.keycloak.status.0.load_balancer.0.ingress.0.ip != "" ? "address" : "hostname"
  }
}
