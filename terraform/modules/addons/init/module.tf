
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }


# module "newrelic" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/newrelic?ref=develop"

#   depends_on = [module.platform]
# }

locals {
  enabled_addons = length(var.enabled_addons) > 0 ? var.enabled_addons : {
    "metrics-server"               = false
    "cluster-autoscaler"           = false
    "aws-node-termination-handler" = false
    "argoproj-argocd"              = false
    "argoproj-rollout"             = false
    "kong-ingress-controller"      = false
  }
}

module "argocd" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/argoproj/argocd/?ref=develop"
  count  = contains(keys(locals.enabled_addons), "argoproj-argocd") && locals.enabled_addons["argoproj-argocd"] ? 1 : 0




  labels       = var.tags
  project_name = var.project_name
}
