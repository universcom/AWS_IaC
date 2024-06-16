variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "cidr_block" {
    description = "value"
    type        = string
}

variable "public_subnet_cidr" {
  description = "value"
  type = string
}

variable "private_subnet_cidr" {
  description = "value"
  type = string
}