variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to use for subnets."
  type        = string
}
