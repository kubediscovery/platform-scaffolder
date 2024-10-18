output "arogcd" {
  value = module.argocd
}

output "publish" {
  value = module.argocd[0].publish
}

# output "http_dns_records" {
#   value = local.http_dns_records
#   description = "values for the http dns records"
# }