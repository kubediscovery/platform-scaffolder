module "http_publish" {
  source = "git::https://github.com/kubediscovery/platform-scaffolder.git//terraform/modules/switch/cloudflare/?ref=develop"

  api_token = var.cloudflare_api_token
  zone_id   = var.cloudflare_zone_id
  dns_records = var.http_dns_records
}
