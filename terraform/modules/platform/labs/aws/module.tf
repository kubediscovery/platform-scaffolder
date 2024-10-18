
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

  enabled_addons         = var.enabled_addons
  project_name           = var.project_name
  cluster_endpoint       = module.k8s_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(module.k8s_cluster.cluster.cluster_ca_certificate)
  tags                   = var.tags
  cluster_token          = module.k8s_cluster.cluster.token
  cloudflare_api_token   = var.cloudflare_api_token
  cloudflare_zone_id     = var.cloudflare_zone_id
  storage = {
    persistent_volume_name = module.k8s_cluster.cluster.volume.persistent_volume_name
    storage_class_name     = module.k8s_cluster.cluster.volume.storage_class_name
    persistent_volume_size = module.k8s_cluster.cluster.volume.persistent_volume_size
  }
}

module "switch_cloud_provider" {
  source           = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/switch/init?ref=develop"
  project_name     = var.project_name
  tags             = var.tags
  http_dns_records = module.addons.http_dns_records
  cloudflare_api_token   = var.cloudflare_api_token
  cloudflare_zone_id     = var.cloudflare_zone_id

  depends_on = [ module.addons.http_dns_records[0] ]
}

