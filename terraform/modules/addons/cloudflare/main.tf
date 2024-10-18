locals {
  create_record = length(var.record_name)
}


resource "cloudflare_dns_record" "record" {
  # count = var.record_name != "" ? 1 : 0 && var.record_address != "" ? 1 : 0
    # count = length([for v in [var.record_name, var.record_address] : v if v != ""])
  # count = local.create_record ? 1 : 0


  zone_id = var.zone_id
  name    = var.record_name
  content = "${local.create_record}-${var.record_address}"
  type    = var.record_type
  proxied = var.record_proxy
  ttl     = var.record_ttl
}
