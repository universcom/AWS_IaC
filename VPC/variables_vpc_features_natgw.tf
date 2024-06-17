variable "eip_name" {
  description = "Elastic IP name for nat_gateway"
  type        = string
  default     = "main-nat-eip"
}

variable "nat_gateway_name" {
  description = "Nat gateway name"
  type        = string
  default     = "main-nat-gateway"
}

variable "private_route_table_name" {
  description = "route table name for private subnet"
  type        = string
  default     = "private-route-table"
}

