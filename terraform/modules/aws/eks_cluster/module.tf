
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
  cluster_version  = var.cluster_version
}

data "aws_eks_cluster_auth" "this" {
  name = module.cluster.cluster_name
}

module "managed_node_group" {
  source = "./managed-node-group"

  project_name          = var.project_name
  tags                  = var.tags
  cluster_name          = module.cluster.cluster_name
  subnet_ids            = [module.network.subnet_priv_1a, module.network.subnet_priv_1b]
  cluster_group_version = var.cluster_group_version
}

module "managed_addons" {
  source = "./managed-addons"

  project_name       = var.project_name
  tags               = var.tags
  cluster_name       = module.cluster.cluster_name
  enabled_csi_driver = true
}