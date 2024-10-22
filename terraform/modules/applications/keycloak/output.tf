output "publish" {
  value = local.publish
  description = "External address to access the Keycloak server"
  sensitive = false
}

output "publish_debug" {
  value = {
    name      = kubernetes_manifest.keycloak.manifest.metadata.name
    namespace = kubernetes_manifest.keycloak.manifest.metadata.namespace
  }
}