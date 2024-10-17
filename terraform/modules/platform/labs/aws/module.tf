
module "k8s_cluster" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/aws/eks_cluster?ref=develop"

  project_name          = var.project_name
  cidr_block            = var.cidr_block
  tags                  = var.tags
  region                = var.region
  cluster_group_version = var.cluster_group_version
  cluster_version       = var.cluster_version
}

resource "local_file" "volume1" {
  content  = module.k8s_cluster.cluster.volume.storage_class_name
  filename = "${path.root}/volume_platform_sc.txt"
}

resource "local_file" "volume2" {
  content  = jsonencode(module.k8s_cluster.cluster.volume.persistent_volume_name)
  filename = "${path.cwd}/volume_platform_sc.txt"
}

module "addons" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/init?ref=develop"

  enabled_addons         = var.enabled_addons
  project_name           = var.project_name
  cluster_endpoint       = module.k8s_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(module.k8s_cluster.cluster.cluster_ca_certificate)
  tags                   = var.tags
  cluster_token          = module.k8s_cluster.cluster.token
  cloudflare_api_token   = var.cloudflare_api_token
  cloudflare_zone_id     = var.cloudflare_zone_id
  cluster_storage_class_name  = module.k8s_cluster.cluster.volume.storage_class_name
  cluster_persistent_volume_name = module.k8s_cluster.cluster.volume.persistent_volume_name
}

