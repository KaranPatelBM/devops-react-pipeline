variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"  
}

variable "s3bucket" {
  default = "eks-s3-bucket"
}

variable "vpc_id" {}
variable "private_subnets" {}
variable "public_subnets" {}

variable "cluster_name" {
  default = "dev-eks-cluster"
}

variable "cluster_version" {
  default = "1.29"
}