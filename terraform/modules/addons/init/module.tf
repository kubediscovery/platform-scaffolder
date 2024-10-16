
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }

locals {
  empty_addons = {
    "metrics_server" = {
      enabled = false
    }
    "cluster_autoscaler" = {
      enabled = false
    }
    "aws_node_termination_handler" = {
      enabled = false
    }
    "argoproj_argocd" = {
      enabled = false
    }
    "argoproj_rollout" = {
      enabled = false
    }
    "kong_ingress_controller" = {
      enabled = false
    }
    "atlantis" = {
      enabled = false
    }
  }

  enabled_addons = {
    "metrics_server"               = try(var.enabled_addons.metrics_server, local.empty_addons.metrics_server)
    "cluster_autoscaler"           = try(var.enabled_addons.cluster_autoscaler, local.empty_addons.cluster_autoscaler)
    "aws_node_termination_handler" = try(var.enabled_addons.aws_node_termination_handler, local.empty_addons.aws_node_termination_handler)
    "argoproj_argocd"              = try(var.enabled_addons.argoproj_argocd, local.empty_addons.argoproj_argocd)
    "argoproj_rollout"             = try(var.enabled_addons.argoproj_rollout, local.empty_addons.argoproj_rollout)
    "kong_ingress_controller"      = try(var.enabled_addons.kong_ingress_controller, local.empty_addons.kong_ingress_controller)
    "atlantis"                     = try(var.enabled_addons.atlantis, local.empty_addons.atlantis)
  }
}

module "argocd" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/argoproj/argocd/?ref=develop"
  count  = local.enabled_addons.argoproj_argocd.enabled ? 1 : 0

  labels        = var.tags
  chart_version = try(local.enabled_addons.argoproj_argocd.version, "7.5.2")
  project_name  = var.project_name
}

# module "argocd_publish" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/cloudflare/?ref=develop"

#   api_token = var.cloudflare_api_token
#   zone_id   = var.cloudflare_api_token
#   record_type = module.argocd[0].publish.type == "address" ? "A" : "CNAME"
#   record_name = module.argocd[0].publish.name
#   record_address = module.argocd[0].publish.address
# }

module "kong" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/kong/?ref=develop"
  count  = local.enabled_addons.kong_ingress_controller.enabled ? 1 : 0

  labels        = var.tags
  chart_version = try(local.enabled_addons.kong_ingress_controller.version, "2.42.0")
  project_name  = var.project_name
}

module "atlantis" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/atlantis/?ref=develop"
  count  = local.enabled_addons.atlantis.enabled ? 1 : 0

  labels          = var.tags
  chart_version   = try(local.enabled_addons.atlantis.version, "5.7.0")
  project_name    = var.project_name
  github_config   = try(local.enabled_addons.atlantis.github_config, {})
  aws_config      = try(local.enabled_addons.atlantis.aws_config, {})
  atlantis_config = try(local.enabled_addons.atlantis.atlantis_config, {})
}

# module "atlantis_publish" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/cloudflare/?ref=develop"

#   api_token = var.cloudflare_api_token
#   zone_id   = var.cloudflare_api_token
#   record_type = length(module.atlantis) > 0 ? (module.atlantis[0].publish.type == "address" ? "A" : "CNAME") : "CNAME"
#   record_name = length(module.atlantis) > 0 ? module.atlantis[0].publish.name : ""
#   record_address = length(module.atlantis) > 0 ? module.atlantis[0].publish.address : ""
# }
