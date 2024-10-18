locals {
  teste = "teste"
}

resource "cloudflare_dns_record" "record" {  

  for_each = { for idx, record in var.dns_records : idx => record if record.name != "" && record.address != "" }
  
  zone_id = var.zone_id
  name    = each.value.name
  content = each.value.address
  type    = each.value.type == "address" ? "A" : "CNAME"
  proxied = var.record_proxy
  ttl     = var.record_ttl
}
