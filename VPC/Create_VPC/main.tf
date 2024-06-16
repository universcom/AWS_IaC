# Configure the AWS provider
provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Create a VPC
resource "aws_vpc" "my_vpc_1" {
  cidr_block = ""
  tags = {
    "key" = ""
  }
}

# Create a public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.my_vpc_1.id
  cidr_block        = var.public_subnet_cidr
  tags = {
    Name = "public_subnet"
  }
}

# Create a private subnet
resource "aws_subnet" "private" {
    vpc_id            = aws_vpc.my_vpc_1.id
    cidr_block        = var.private_subnet_cidr
    tags = {
        Name = "private_subnet"
  }
}

#Create an internet gateway(igw)
resource "aws_internet_gateway" "my_vpc_1_igw" {
  vpc_id = aws_vpc.my_vpc_1.id
  tags = {
    Name = "my_vpc_1_igw"
  }
}

# Create a route table for the public subnet
resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.my_vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_vpc_1_igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

#Associate the route table with the public subnet
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_subnet.id
}

# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.my_vpc_1.id
}

# Output the Public Subnet ID
output "public_subnet_id" {
  value = aws_subnet.public.id
}

# Output the Private Subnet ID
output "private_subnet_id" {
  value = aws_subnet.private.id
}