locals {
  http_dns_records = concat([module.keycloak[0].publish], [])

}