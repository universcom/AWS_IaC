# Create a VPC Endpoint for S3
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = var.endpoint_service_name
  vpc_endpoint_type = var.vpc_endpoint_type

  route_table_ids = var.route_table_ids

  tags = {
    Name = var.endpoint_name
  }
}