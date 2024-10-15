

module "platform" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/azure/aks_cluster?ref=develop"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = var.tags
  region       = var.cloud_provider == "azure" ? "East US" : "East US"
}

# module "argocd" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/argoproj/argocd/?ref=develop"

#   project_name = var.project_name
#   depends_on   = [module.platform]
# }

# module "argocd_applications" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/argoproj/applications/?ref=develop"

#   depends_on = [module.platform]
# }

