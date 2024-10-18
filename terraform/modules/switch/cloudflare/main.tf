locals {
  dns_records_map = {
    for idx, record in var.dns_records : idx => {
      name    = record.name
      address = record.address
      type    = record.type  == "address" ? "A" : "CNAME"
    }
    if record.name != "" && record.address != "" 
  }
}


# resource "cloudflare_dns_record" "record" {  

#   for_each = local.dns_records_map
  
#   zone_id = var.zone_id
#   name    = each.value.name
#   content = each.value.address
#   type    = each.value.type == "address" ? "A" : "CNAME"
#   proxied = var.record_proxy
#   ttl     = var.record_ttl
# }
