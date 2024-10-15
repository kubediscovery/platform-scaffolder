# output "argocd" {
#   value = {
#     "cluster_ip" = module.argocd.service.spec.0.cluster_ip
#     "aasecret"   = module.argocd.secret.data.password
#   }
# }

output "cluster" {
  value = module.k8s_cluster
}

output "project_name" {
  value = var.project_name
}
