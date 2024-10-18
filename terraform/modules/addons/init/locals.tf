# locals {
#   http_dns_records = merge([module.argocd[0].publish],module.kong[0].publish,[module.atlantis[0].publish])
# }