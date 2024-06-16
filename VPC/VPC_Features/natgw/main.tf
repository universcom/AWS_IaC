resource "aws_eip" "natgw" {
  tags = {
    Name = var.eip_name
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw.id
  subnet_id = var.public_subnet_id

  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_route_table" "private_subnet" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
   tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private_subnet.id
}

