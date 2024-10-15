
data "aws_region" "current" {}

module "network" {
  source = "./network"

  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
}

module "cluster" {
  source = "./clusters"

  project_name     = var.project_name
  tags             = var.tags
  public_subnet_1a = module.network.subnet_pub_1a
  public_subnet_1b = module.network.subnet_pub_1b
}

data "aws_eks_cluster_auth" "this" {
  name = module.cluster.cluster_name
}

module "managed_node_group" {
  source = "./managed-node-group"

  project_name = var.project_name
  tags         = var.tags
  cluster_name = module.cluster.cluster_name
  subnet_ids   = [module.network.subnet_priv_1a, module.network.subnet_priv_1b]
}

# module "managed-addons" {
#   source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/aws/eks_cluster/managed-addons/?ref=develop"

#   project_name       = var.project_name
#   tags               = var.tags
#   cluster_name       = module.cluster.cluster_name
#   enabled_csi_driver = true
# }

# module "argocd_applications" {
#   source = "git::https://github.com/kubediscovery/platform-infrastructure.git//modules/addons/argoproj/applications/?ref=develop"

#   password    = module.argocd.secret.data.password
#   server_addr = module.argocd.service.spec.0.cluster_ip
# }

# module "lb_controller" {
#   source = "./lb-controller"

#   project_name      = var.project_name
#   tags              = var.tags
#   cluster_name      = module.cluster.cluster_name
#   oidc_provider_url = module.cluster.oidc_provider
# }