
output "publish" {
  value =  local.publish
  description = "External address to access the Atlantis server"
  sensitive = false
}


output "home" {
  value = var.home
}