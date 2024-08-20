terraform {
  backend "s3" {
    bucket = "eks-github-actions"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}