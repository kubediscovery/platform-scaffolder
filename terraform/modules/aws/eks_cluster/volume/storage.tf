
resource "kubernetes_storage_class_v1" "efs_sc" {
  metadata {
    name = var.storage_class_name
  }
  storage_provisioner = var.storage_provisioner
  reclaim_policy      = "Retain"
}

resource "kubernetes_persistent_volume_v1" "efs_pv" {
  metadata {
    name = var.persistent_volume_name
  }
  spec {
    capacity = {
      storage = var.storage_capacity_size
    }
    access_modes = [
      "ReadWriteMany",
      "ReadWriteOnce"
    ]
    volume_mode                      = "Filesystem"
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = kubernetes_storage_class_v1.efs_sc.metadata.0.name
    persistent_volume_source {

      csi {
        driver        = kubernetes_storage_class_v1.efs_sc.storage_provisioner
        volume_handle = "EFS_VOLUME_ID"
      }
    }
  }
}