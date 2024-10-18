locals {
  create_record = length(var.record_name) == 0 ? false : true
}


resource "cloudflare_dns_record" "record" {  
  count = local.create_record ? 1 : 0

  zone_id = var.zone_id
  name    = var.record_name
  content = "${local.create_record}-${var.record_address}"
  type    = var.record_type
  proxied = var.record_proxy
  ttl     = var.record_ttl
}
