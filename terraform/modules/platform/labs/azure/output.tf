output "argocd" {
  value = "module.argocd"
}

output "cluster" {
  value = module.platform
}

output "project_name" {
  value = var.project_name
}