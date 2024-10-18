
resource "cloudflare_dns_record" "record" {  

  for_each = { for idx, record in var.dns_records : idx => record if record.record_name != "" && record.record_address != "" }
  
  zone_id = var.zone_id
  name    = each.value.record_name
  content = each.value.record_address
  type    = each.value.record_type == "address" ? "A" : "CNAME"
  proxied = var.record_proxy
  ttl     = var.record_ttl
}