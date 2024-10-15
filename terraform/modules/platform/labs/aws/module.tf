

module "platform" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/aws/eks_cluster?ref=develop"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = var.tags
  region       = var.region
}

# module "addons" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/init/?ref=develop"

#   project_name           = var.project_name
#   cluster_endpoint       = module.platform.cluster.endpoint
#   cluster_ca_certificate = base64decode(module.platform.cluster.cluster_ca_certificate)
#   cluster_token          = module.platform.cluster.token
# }
