resource "aws_eks_cluster" "main" {
    name = var.cluster_name
    role_arn = aws_iam_role.aws_eks_cluster.arn

    vpc_config {
      subnet_ids = var.private_subnets
      security_group_ids = [aws_security_group.eks_cluster_sg.id]
    }

    version = var.cluster_version
  
}