

module "ascode" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/platform/labs/aws?ref=develop"

  project_name = local.yaml_configs.name
  cidr_block   = local.yaml_configs.cidr
  tags         = local.tags
  region       = local.region
}