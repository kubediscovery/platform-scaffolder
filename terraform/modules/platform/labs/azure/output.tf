output "argocd" {
  value = "module.argocd"
}

output "cluster" {
  value = module.k8s_cluster
}

output "project_name" {
  value = var.project_name
}