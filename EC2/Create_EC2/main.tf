# EC2 Instance
resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [aws_security_group.allow_main_ports.id]

  tags = {
    Name = var.instance_name
  }
}

# Output instance ID and public IP
output "instance_id" {
  value = aws_instance.instance.id
}

output "public_ip" {
  value = aws_instance.instance.public_ip
}