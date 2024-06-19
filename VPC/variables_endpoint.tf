variable "vpc_id" {
  type = string
}

variable "endpoint_service_name" {
  type = string
}

variable "vpc_endpoint_type" {
  type = string
  default = "Gateway"
}

variable "endpoint_name" {
  type = string
}

variable "route_table_ids" {
  type = list(string)
}