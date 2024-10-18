
variable "api_token" {
  type        = string
  description = "Cloudflare API token"
}

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID"
}

variable "dns_records" {
  type = list(object({
    name = string
    type = string
    address = string
    
  }))
}

variable "record_proxy" {
  type        = bool
  default     = false
  description = "Record proxy to be used in Cloudflare"
}

variable "record_ttl" {
  type        = number
  default     = 1
  description = "Record TTL to be used in Cloudflare"
}