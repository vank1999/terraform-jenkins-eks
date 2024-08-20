variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnets" {
  description = "subnets_cidr"
  type        = list(string)
}

variable "instance_type" {
  description = "instance type"
  type = string
}