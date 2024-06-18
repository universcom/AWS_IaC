resource "aws_eip" "my_instance_eip" {
  count      = var.associate_eip ? 1 : 0
  instance   = aws_instance.instance.id
  domain     = "vpc"
  depends_on = [aws_instance.instance]
  
  tags = {
    Name = "${var.instance_name}-eip"
  }
}