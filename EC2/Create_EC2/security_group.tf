resource "aws_security_group" "allow_main_ports" {
  name = "${var.vpc_name}_allow_main_port"
  vpc_id = var.vpc_id
  description = "allow ssh http https icmp"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.vpc_name}_allow_main_port"
  }
}

resource "aws_security_group_rule" "allow_http" {
  type                  = "ingress"
  security_group_id     = aws_security_group.allow_main_ports.id
  from_port             = 80
  to_port               = 80
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_https" {
  type                  = "ingress"
  security_group_id     = aws_security_group.allow_main_ports.id
  from_port             = 443
  to_port               = 443
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_ssh" {
  type                  = "ingress"
  security_group_id     = aws_security_group.allow_main_ports.id
  from_port             = 22
  to_port               = 22
  protocol              = "tcp"
  cidr_blocks           = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_all_icmp" {
  type = "ingress"
  security_group_id = aws_security_group.allow_main_ports.id
  cidr_blocks = ["0.0.0.0/0"]
  to_port = "-1"
  from_port = "-1"
  protocol = "1" #ICMP porotocol number
}