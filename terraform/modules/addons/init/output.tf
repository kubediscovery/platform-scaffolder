output "arogcd" {
  value = module.argocd
}

output "publish" {
  value = module.argocd[0].publish
}