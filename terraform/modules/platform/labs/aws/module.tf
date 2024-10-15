

module "platform" {
<<<<<<< HEAD
  source = "git::https://github.com/kubediscovery/platform-infrastructure.git//terraform/modules/aws/eks_cluster?ref=aws"
=======
  source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/aws/eks_cluster?ref=develop"
>>>>>>> b1a9b92 (fix: :bug: update branch at modules)

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = var.tags
  region       = var.region
}

# module "addons" {
<<<<<<< HEAD
#   source = "git::https://github.com/kubediscovery/platform-infrastructure.git//terraform/modules/addons/init/?ref=aws"
=======
#   source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/addons/init/?ref=develop"
>>>>>>> b1a9b92 (fix: :bug: update branch at modules)

#   project_name           = var.project_name
#   cluster_endpoint       = module.platform.cluster.endpoint
#   cluster_ca_certificate = base64decode(module.platform.cluster.cluster_ca_certificate)
#   cluster_token          = module.platform.cluster.token
# }

