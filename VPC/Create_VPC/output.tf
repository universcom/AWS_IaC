
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

# Outpute the IGW ID 
output "igw_id" {
  value = aws_internet_gateway.my_vpc_1_igw.id
}