output "name" {
  value = local.yaml_configs.name
}

output "tags" {
  value = local.yaml_configs.tags
}

output "provider" {
  value = local.yaml_configs.provider
}

output "region" {
  value = local.region
}

output "cluster" {
  value     = module.ascode.cluster
  sensitive = true
}

output "project_name" {
  value = module.ascode.project_name
}

output "kubeconfig" {
  value     = module.ascode.cluster.cluster.kubeconfig
  sensitive = true
}