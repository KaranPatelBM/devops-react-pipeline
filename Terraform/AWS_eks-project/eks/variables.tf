variable "cluster_name" {
    type = string
}
variable "cluster_version" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable "private_subnets" {
     type = list(string)
}
variable "public_subnets" {
     type = list(string)
}
variable "aws_region" {
    type = string
}