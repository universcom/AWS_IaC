variable "vpc_name" {
    description = "value"
    type        = string
}
variable "vpc_cidr_block" {
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

variable "igw_name" {
  description = "value"
  type = string
  default = "main-igw"
}

variable "public_route_table_name" {
  description = "value"
  type = string
  default = "main_public_route_table"
}
