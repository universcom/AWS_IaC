provider "aws" {
  region = var.aws_region
}

module "create_vpc" {
  source              = "./C"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  vpc_name            = "main-vpc"
  public_subnet_name  = "public-subnet"
  private_subnet_name = "private-subnet"
  igw_name            = "main-igw"
  public_route_table_name = "public-route-table"
}

module "nat-gateway" {
  source              = "./VPC_Features/natgw"
  vpc_id              = module.vpc.vpc_id
  public_subnet_id    = module.vpc.public_subnet_id
  private_subnet_id   = module.vpc.private_subnet_id
  eip_name            = "main-nat-eip"
  nat_gateway_name    = "main-nat-gateway"
  private_route_table_name = "private-route-table"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "nat_gateway_id" {
  value = module.nat-gateway.nat_gateway_id
}