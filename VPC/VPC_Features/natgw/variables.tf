variable "eip_name" {
  description = "The name of the Elastic IP."
  type        = string
}

variable "nat_gateway_name" {
  description = "The name of the NAT Gateway."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet."
  type        = string
}

variable "private_route_table_name" {
  description = "The name of the private route table."
  type        = string
}

