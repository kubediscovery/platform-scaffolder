output "publish" {
  value = local.publish
  description = "External address to access the Keycloak server"
  sensitive = false
}

output "publish_debug" {
  value = {
    name      = kubernetes_manifest.keycloak.manifest.metadata.name
    namespace = kubernetes_manifest.keycloak.manifest.metadata.namespace
    address = data.kubernetes_ingress_v1.keycloak.status.0.load_balancer.0.ingress.0.ip
  }
}