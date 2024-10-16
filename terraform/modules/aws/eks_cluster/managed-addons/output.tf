output "storage_class" {
  value       = kubernetes_storage_class.standard.metadata.0.name
  description = "value of the storage class name for EFS"
}

output "persistent_volume" {
  value       = kubernetes_persistent_volume_v1.standard.metadata.0.name
  description = "value of the persistent volume name for EFS"
}
