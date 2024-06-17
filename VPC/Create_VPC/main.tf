# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create a public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  tags = {
    Name = "${aws_vpc.vpc.arn}_public_subnet"
  }
}

# Create a private subnet
resource "aws_subnet" "private" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.private_subnet_cidr
    tags = {
        Name = "${aws_vpc.vpc.arn}_private_subnet"
  }
}

#Create an internet gateway(igw)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw_name
  }
}

# Create a route table for the public subnet
resource "aws_route_table" "internet_access" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}

#Associate the route table with the public subnet
resource "aws_route_table_association" "internet_access" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.internet_access.id
}