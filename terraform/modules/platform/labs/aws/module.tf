
module "k8s_cluster" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/aws/eks_cluster?ref=develop"

  project_name          = var.project_name
  cidr_block            = var.cidr_block
  tags                  = var.tags
  region                = var.region
  cluster_group_version = var.cluster_group_version
  cluster_version       = var.cluster_version
}

module "addons" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/init?ref=develop"

  enabled_addons = var.enabled_addons
}

