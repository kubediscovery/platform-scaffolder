

module "platform" {
  source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/azure/aks_cluster?ref=aws"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = var.tags
  region       = var.cloud_provider == "azure" ? "East US" : "East US"
}

# module "argocd" {
#   source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/addons/argoproj/argocd/?ref=aws"

#   project_name = var.project_name
#   depends_on   = [module.platform]
# }

# module "argocd_applications" {
#   source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/addons/argoproj/applications/?ref=aws"

#   depends_on = [module.platform]
# }

