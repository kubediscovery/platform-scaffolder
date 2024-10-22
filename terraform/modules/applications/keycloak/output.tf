output "publish" {
  value = local.publish
  description = "External address to access the Keycloak server"
  sensitive = false
}

output "publish_debug" {
  value = data.kubernetes_ingress_v1.keycloak.status.0.load_balancer
}