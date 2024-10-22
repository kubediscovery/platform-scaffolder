output "argocd" {
  value = "module.argocd"
}

output "cluster" {
  value = module.k8s_cluster
}

output "project_name" {
  value = var.project_name
}

# output "addons" {
#   value = module.addons
# }

output "publish" {
  value = module.applications.http_dns_records
}

# output "home" {
#   value = module.addons.home
# }