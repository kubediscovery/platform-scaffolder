

module "k8s_cluster" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/azure/aks_cluster?ref=develop"

  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = var.tags
  region       = var.region == "eastus" ? "East US" : "East US"
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
    persistent_volume_name = "persistent_volume_name"
    storage_class_name     = "azurefile"
    persistent_volume_size = "1Gi"
  }
}

module "deployment" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/deployment/init?ref=develop"

  enabled_addons         = var.enabled_addons
  project_name           = var.project_name
  cluster_endpoint       = module.k8s_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(module.k8s_cluster.cluster.cluster_ca_certificate)
  tags                   = var.tags
  cluster_token          = module.k8s_cluster.cluster.token
  storage = {
    persistent_volume_name = "persistent_volume_name"
    storage_class_name     = "azurefile"
    persistent_volume_size = "1Gi"
  }
  # gitops_namespace = module.addons.gitops_namespace
  # gitops_source_repos_urls = module.addons.gitops_source_repos_urls
}

module "switch_cloud_provider" {
  source               = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/switch/init?ref=develop"
  project_name         = var.project_name
  tags                 = var.tags
  http_dns_records     = module.deployment.http_dns_records
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
}