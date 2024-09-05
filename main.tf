#EC2 for demo
module "ec2" {
  source          = "./modules/ec2"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  instance_type = var.instance_type
  environment = var.environment
  private_ips = var.private_ips
  file_name = var.file_name
  key_pair_name = var.key_pair_name
}