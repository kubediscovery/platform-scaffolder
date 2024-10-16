variable "tags" {
  type        = map(string)
  description = "Tags to be added to the AWS resources"
  default = {
    Environment = "dev"
    PartOf      = "learn-aws"
  }
}

variable "project_name" {
  type    = string
  default = "Name of the project and prefix for resources"
}

variable "public_subnet_1a" {
  type        = string
  description = "Subnet to create EKS cluster AZ 1a"
}

variable "public_subnet_1b" {
  type        = string
  description = "Subnet to create EKS cluster AZ 1b"
}

variable "cluster_version" {
  type        = string
  description = "Cluster version"
  default     = "1.31"
}

variable "support_type" {
  type        = string
  description = "Support type for the EKS cluster"
  default     = "STANDARD"

}