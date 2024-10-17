
locals {
  enabled = length(var.record_name) > 0 ? true : false
}
resource "cloudflare_dns_record" "record" {
  count = local.enabled ? 1 : 0

  zone_id = var.zone_id
  name    = var.record_name
  content = var.record_address
  type    = var.record_type
  proxied = var.record_proxy
  ttl     = var.record_ttl
}