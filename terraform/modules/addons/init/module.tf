
# module "kong" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/kong/?ref=develop"

#   depends_on = [module.platform]
# }


# module "newrelic" {
#   source = "git::https://github.com/kubediscovery/platform-scaffolder.git//modules/addons/newrelic?ref=develop"

#   depends_on = [module.platform]
# }

resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "echo ${var.enabled_addons}"
  }
}