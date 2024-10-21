
resource "kubernetes_storage_class_v1" "efs_sc" {
  metadata {
    name   = var.storage_class_name
    labels = var.tags
  }
  storage_provisioner = var.storage_provisioner
  reclaim_policy      = "Delete"
  volume_binding_mode = "Immediate"
  allow_volume_expansion = false  
}

resource "aws_efs_file_system" "this" {
  creation_token = "efs-token"
  tags = var.tags
}

resource "aws_efs_mount_target" "this" {
  for_each = toset(var.subnet_ids)
  file_system_id = aws_efs_file_system.this.id
  subnet_id      = each.value
  security_groups = var.security_group_ids
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
      "ReadWriteOnce",
      "ReadWriteMany"
    ]
    volume_mode                      = "Filesystem"
    persistent_volume_reclaim_policy = "Delete"
    storage_class_name               = kubernetes_storage_class_v1.efs_sc.metadata.0.name
    persistent_volume_source {
      csi {
        driver        = kubernetes_storage_class_v1.efs_sc.storage_provisioner
        volume_handle = aws_efs_file_system.this.id
      }
    }
  }
}

resource "kubernetes_persistent_volume_v1" "efs_pv_disk" {
  metadata {
    name   = "platform-shared"
    labels = var.tags
  }
  spec {
    capacity = {
      storage = var.storage_capacity_size
    }

    access_modes = [
      "ReadWriteOnce",
      "ReadWriteMany"
    ]
    volume_mode                      = "Block"
    persistent_volume_reclaim_policy = "Delete"
    storage_class_name               = kubernetes_storage_class_v1.efs_sc.metadata.0.name
    persistent_volume_source {
      csi {
        driver        = kubernetes_storage_class_v1.efs_sc.storage_provisioner
        volume_handle = aws_efs_file_system.this.id
      }
    }
  }
}

