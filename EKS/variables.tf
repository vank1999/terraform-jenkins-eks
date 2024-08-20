variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnets" {
  description = "subnets_cidr"
  type        = list(string)
}

variable "private_subnets" {
  description = "subnets_cidr"
  type        = list(string)
}