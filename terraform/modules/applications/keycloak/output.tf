output "publish" {
  value = local.publish
  description = "External address to access the Keycloak server"
  sensitive = false
}