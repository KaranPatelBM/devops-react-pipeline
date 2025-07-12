module "eks_cluster_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

    role_name = "eks-cluster-role"

    trusted_role_services = ["eks.amazonaws.com"]

    custom_role_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"]
}