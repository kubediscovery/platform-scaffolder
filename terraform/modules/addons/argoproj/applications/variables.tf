variable "server_addr" {
  type        = string
  description = "The address of the ArgoCD server"
}

variable "password" {
  type        = string
  description = "The address of the ArgoCD server"
}
variable "username" {
  type        = string
  description = "The address of the ArgoCD server"
  default     = "admin"
}

variable "insecure" {
  type        = bool
  description = "The  address of the ArgoCD server"
  default     = true
}

variable "grpc_web" {
  type        = bool
  description = "The  address of the ArgoCD server"
  default     = true
}