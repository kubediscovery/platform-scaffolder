
variable "api_token" {
  type        = string
  description = "Cloudflare API token"
}

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID"
}

variable "record_type" {
  type        = string
  default     = "A"
  description = "Record type to be used in Cloudflare"
}

variable "record_name" {
  type        = string
  description = "Record name to be used in Cloudflare"
}

variable "record_address" {
  type        = string
  description = "Record name to be used in Cloudflare"
}

variable "record_proxy" {
  type        = bool
  default     = false
  description = "Record proxy to be used in Cloudflare"
}

variable "record_ttl" {
  type        = number
  default     = 3600
  description = "Record TTL to be used in Cloudflare"
}