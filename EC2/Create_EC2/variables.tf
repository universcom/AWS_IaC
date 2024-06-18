variable "vpc_id" {
  description = "ID of VPC that the instance is launched on it"
  type = string
}

variable "vpc_name" {
  description = "ID of VPC that the instance is launched on it"
  type = string
}

variable "instance_name" {
  description = "Name of instance will be launched"
  type = string
}

variable "ami_id" {
  description = "ID of Instance Image"
  type = string
}

variable "instance_type" {
  description = "Name of instance flavor"
  type = string
}

variable "subnet_id" {
  description = "ID of subnet (AZ) will be launched on it"
  type = string
}