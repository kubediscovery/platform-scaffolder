output "storage_class_name" {
  value       = kubernetes_storage_class_v1.efs_sc.metadata.0.name
  description = "value of storage class name"
}

output "persistent_volume_name" {
  value       = kubernetes_persistent_volume_v1.efs_pv.metadata.0.name
  description = "value of persistent volume name"
}