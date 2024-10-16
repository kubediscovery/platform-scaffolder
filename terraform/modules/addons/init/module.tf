
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }


# module "newrelic" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/newrelic?ref=develop"

#   depends_on = [module.platform]
# }

module "argocd" {
  source       = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/addons/argoproj/argocd/?ref=develop"
  count        = var.enabled_addons.argoproj-argocd ? 1 : 0
  labels       = var.tags
  project_name = var.project_name
}
