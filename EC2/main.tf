module "create_EC2" {
  source = "./Create_EC2"
  vpc_id = var.vpc_id
  vpc_name = var.vpc_name
  instance_name = var.instance_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  subnet_type = var.subnet_type
  tenancy = var.tenancy
  associate_eip = var.associate_eip

}

output "instance_id" {
  value = module.create_EC2.instance_id
}

output "public_ip" {
  value = module.create_EC2.public_ip
}