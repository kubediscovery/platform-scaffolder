resource "aws_eks_addon" "ebs_csi_driver" {
  count = var.enabled_csi_driver ? 1 : 0

  cluster_name = var.cluster_name
  addon_name   = "aws-ebs-csi-driver"
  tags         = var.tags
}


resource "kubernetes_storage_class" "standard" {
  metadata {
    name = "efs-standard"
  }

  storage_provisioner = "efs.csi.aws.com"

  reclaim_policy      = "Delete"
  volume_binding_mode = "WaitForFirstConsumer"

  depends_on = [ aws_eks_addon.ebs_csi_driver ]
}

resource "kubernetes_persistent_volume_v1" "standard" {
  metadata {
    name = "efs-standard"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes       = ["ReadWriteMany"]
    volume_mode        = "Filesystem"
    storage_class_name = kubernetes_storage_class.standard.metadata.0.name

    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = "EFS_VOLUME_ID"
      }
    }
  }

  depends_on = [ aws_eks_addon.ebs_csi_driver ]
}
