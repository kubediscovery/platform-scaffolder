output "kong" {
  value = helm_release.kong
}

output "publish" {
  value = [
    for item in local.publish : item if item.name != "" && item.address != ""
  ]
  description = "External address to access Kong services (manager, portal, portalapi, admin)"
  sensitive   = false
}

