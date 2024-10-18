
resource "cloudflare_dns_record" "record" {  

  for_each = { for record in var.dns_records : record.record_name => record }
  
  zone_id = var.zone_id
  name    = each.value.record_name
  content = each.value.record_address
  type    = each.value.record_type
  proxied = var.record_proxy
  ttl     = var.record_ttl
}
