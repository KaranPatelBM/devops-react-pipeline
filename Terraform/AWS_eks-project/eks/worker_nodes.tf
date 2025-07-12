resource "aws_eks_node_group" "default" {
  cluster_name = aws_eks_cluster.main.name
  node_group_name = "default"
  node_role_arn = aws_iam_role.iam_eks_nodes.arn
  subnet_ids = var.private_subnets

    remote_access {
    # ec2_ssh_key = var.ssh_key_name   # optional if you want SSH access
    source_security_group_ids = [aws_security_group.worker_nodes_sg.id]
  }

  scaling_config {
    desired_size = 2
    max_size = 3
    min_size = 1
  }
  instance_types = ["t3.medium"]
}