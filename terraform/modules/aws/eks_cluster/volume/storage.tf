
resource "kubernetes_storage_class_v1" "efs_sc" {
  metadata {
    name = "efs-sc"
  }
  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Retain"
}

resource "kubernetes_persistent_volume_v1" "efs_pv" {
  metadata {
    name = "efs_pv"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = [
      "ReadWriteMany",
      "ReadWriteOnce"
      ]
      volume_mode = "Filesystem"
      persistent_volume_reclaim_policy = "Retain"
      storage_class_name = kubernetes_storage_class_v1.efs_sc.metadata.0.name
    persistent_volume_source {
      
      csi {
        driver = "efs.csi.aws.com"
        volume_handle = "EFS_VOLUME_ID"
      }
    }
  }
}
