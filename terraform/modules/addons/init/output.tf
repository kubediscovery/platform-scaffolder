output "arogcd" {
  value = [
    module.argocd.service,
    module.argocd.external_address,
    module.argocd.argocd,
  ]
}