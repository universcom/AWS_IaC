provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "create_vpc" {
  source                      = "./Create_VPC"
  vpc_cidr_block              = var.vpc_cidr_block
  public_subnet_cidr          = var.public_subnet_cidr
  private_subnet_cidr         = var.private_subnet_cidr
  vpc_name                    = var.vpc_name
  igw_name                    = var.igw_name
  public_route_table_name     = var.public_route_table_name
}

module "nat-gateway" {
  source              = "./VPC_Features/natgw"
  vpc_id              = module.create_vpc.vpc_id
  public_subnet_id    = module.create_vpc.public_subnet_id
  private_subnet_id   = module.create_vpc.private_subnet_id
  eip_name            = var.eip_name
  nat_gateway_name    = var.nat_gateway_name
  private_route_table_name = var.private_route_table_name
}

module "endpoint"{
  source = "./VPC_Features/endpoint"
  vpc_id = module.create_vpc.vpc_id
  endpoint_name = var.endpoint_name
  endpoint_service_name = var.endpoint_service_name
  vpc_endpoint_type = var.vpc_endpoint_type
  route_table_ids = var.route_table_ids
}


output "vpc_id" {
  value = module.create_vpc.vpc_id
}

output "public_subnet_id" {
  value = module.create_vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.create_vpc.private_subnet_id
}

output "igw_id" {
  value = module.create_vpc.igw_id
}
output "nat_gateway_id" {
  value = module.nat-gateway.nat_gateway_id
}