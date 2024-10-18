
resource "local_file" "name" {
  for_each = { for idx, record in var.dns_records : idx => record }
  content = "\n ${each.value.record_name}-${each.value.record_address}-${each.value.record_type}"
  filename = "${path.root}/name.txt"
}

resource "cloudflare_dns_record" "record" {  

  for_each = { for idx, record in var.dns_records : idx => record }
  
  zone_id = var.zone_id
  name    = each.value.record_name
  content = each.value.record_address
  type    = each.value.record_type
  proxied = var.record_proxy
  ttl     = var.record_ttl

  depends_on = [ local_file.name ]
}
