output "kong" {
  value = helm_release.kong
}

output "publish" {
  value = local.publish
  description = "External address to access Kong services (manager, portal, portalapi, admin)"
  sensitive   = false
}

