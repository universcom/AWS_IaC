variable "vpc_id" {
  description = "ID of VPC that the instance is launched on it"
  type        = string
}

variable "vpc_name" {
  description = "ID of VPC that the instance is launched on it"
  type        = string
}

variable "instance_name" {
  description = "Name of instance will be launched"
  type        = string
  default     = "my_instance"
}

variable "ami_id" {
  description = "ID of Instance Image"
  type        = string
  default     = "ami-08a0d1e16fc3f61ea"
}

variable "instance_type" {
  description = "Name of instance flavor"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID of subnet (AZ) will be launched on it"
  type        = string
}

variable "subnet_type" {
  description = "type of subnet, public(access to internet) or private subnet"
  type        = string
  default     = "public"
}

variable "tenancy" {
  description = "Valid values are default, dedicated, and host"
  type        = string
  default     = "default"
}