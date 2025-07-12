terraform {
  backend "s3" {
    bucket = "eks-s3-bucket"         #should already exist
    key = "dev/terraform.tfstate"    #path set inside bucket
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}