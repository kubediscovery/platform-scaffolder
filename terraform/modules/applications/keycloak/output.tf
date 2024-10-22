output "publish" {
  value = local.publish
  description = "External address to access the Keycloak server"
  sensitive = false
}

output "publish_debug" {
  value = kubernetes_manifest.keycloak.manifest.0.metadata
}