resource "aws_eks_addon" "ebs_csi_driver" {
  count = var.enabled_csi_driver ? 1 : 0

  cluster_name = var.cluster_name
  addon_name   = "aws-ebs-csi-driver"
  tags         = var.tags
}


resource "kubernetes_storage_class" "standard" {
  metadata {
    name = "standard"
  }

  storage_provisioner = "efs.csi.aws.com"

  reclaim_policy      = "Delete"
  volume_binding_mode = "WaitForFirstConsumer"
}
