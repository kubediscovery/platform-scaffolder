variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token to manage DNS records"
  default     = ""
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare API token to manage DNS records"
  default     = ""
}
variable "tags" {
  type        = map(string)
  description = "Tags to be added to the AWS resources"
  default = {
    Environment = "dev"
    PartOf      = "learn-aws"
  }
}

variable "cloud_provider" {
  type        = string
  default     = "aws"
  description = "Name of the cloud provider"
  validation {
    condition     = var.cloud_provider == "aws" || var.cloud_provider == "azure"
    error_message = "Cloud provider must be either 'aws' or 'azure'"
  }
}

variable "project_name" {
  type        = string
  description = "Name of the project and prefix for resources"
}

variable "http_dns_records" {
  # type = list(object({
  #   record_name = string
  #   record_type = string
  #   record_address = string    
  # }))
  # default = [ {
  #   record_name = ""
  #   record_type = ""
  #   record_address = ""
  # } ]
  type = any
  description = "values for the http dns records to be added"
}
