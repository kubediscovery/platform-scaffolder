resource "aws_iam_role" "eks_mng_role" {
  name = "${var.project_name}-mng-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
    }]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mng-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_mng_role_attachment_worker" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_mng_role_attachment_ecr" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks_mng_role_attachment_cni" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}


resource "aws_iam_policy" "eks_ebs_policy" {
  name        = "eks-ebs-policy"
  description = "Policy to allow EKS to create and manage EBS volumes"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateVolume",
          "ec2:DeleteVolume",
          "ec2:AttachVolume",
          "ec2:DetachVolume",
          "ec2:DescribeVolumes",
          "ec2:DescribeVolumeStatus",
          "ec2:DescribeVolumeAttribute",
          "ec2:ModifyVolume",
          "ec2:DescribeInstances",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeTags",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeSnapshots",
          "ec2:DescribeVolumesModifications"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "mng_ebs_policy_attachment" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = aws_iam_policy.eks_ebs_policy.arn
}

resource "aws_iam_role_policy_attachment" "mng_ebs_csi_policy_attachment" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

resource "aws_iam_role_policy_attachment" "mng_efs_csi_policy_attachment" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_efs_csi_policy_operator_attachment" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/ROSAAmazonEBSCSIDriverOperatorPolicy"
}

resource "aws_iam_policy" "detach_delete_eni_policy" {
  name        = "DetachDeleteENIPolicy"
  description = "Policy to allow detaching and deleting network interfaces"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeNetworkInterfaces",
          "ec2:DetachNetworkInterface",
          "ec2:DeleteNetworkInterface"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "detach_delete_eni_policy_attachment" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = aws_iam_policy.detach_delete_eni_policy.arn
}

#  LOAD BALNCER
resource "aws_iam_policy" "eks_controller_policy" {
  name   = "${var.project_name}-lb-controller"
  policy = file("${path.module}/iam_policy.json")

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-lb-controller"
    }
  )
}
resource "aws_iam_role" "eks_lb_controller_role" {
  name = "${var.project_name}-eks-lb-controller-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"

      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks-lb-controller-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_lb-controller_policy_attachment" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}
