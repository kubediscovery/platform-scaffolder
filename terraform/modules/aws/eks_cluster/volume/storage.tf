
resource "kubernetes_storage_class_v1" "efs_sc" {
  metadata {
    name   = var.storage_class_name
    labels = var.tags
  }
  storage_provisioner = var.storage_provisioner
  reclaim_policy      = "Retain"
}

resource "kubernetes_persistent_volume_v1" "efs_pv" {
  metadata {
    name   = var.persistent_volume_name
    labels = var.tags
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

resource "kubernetes_persistent_volume_claim_v1" "this" {
  metadata {
    name   = "efs-pvc"
    namespace = "default"
    labels = var.tags
  }
  spec {
    access_modes = [
      "ReadWriteMany",
      "ReadWriteOnce"
    ]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = kubernetes_storage_class_v1.efs_sc.metadata.0.name
  }
}