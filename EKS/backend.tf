terraform {
  backend "s3" {
    bucket = "ak-terraform-eks"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}