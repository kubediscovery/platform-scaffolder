variable "storage_class_name" {
  type        = string
  default     = "efs-sc"
  description = "Storage class name for the volume to be created"
}

variable "persistent_volume_name" {
  type        = string
  default     = "efs-pv"
  description = "Persistent volume name for the volume to be created in the cluster"
}

variable "storage_capacity_size" {
  type        = string
  default     = "2Gi"
  description = "Storage capacity size for the volume to be created"
}

variable "storage_provisioner" {
  type        = string
  default     = "efs.csi.aws.com"
  description = "Storage provisioner for the volume to be created"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be added to the AWS resources"
  default = {}
}
