#VPC module
module "vpc" {
  source            = "../../modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
}
#EC2 module
module "ec2" {
  source          = "../../modules/ec2"
  instance_type   = var.instance_type
  environment     = var.environment
  private_ips     = var.private_ips
  file_name       = var.file_name
  key_pair_name   = var.key_pair_name
  private_subnets = module.vpc.private_subnets
  availability_zone = var.availability_zone
  depends_on = [
    module.vpc
  ]
}
#S3 module
module "s3" {
  source         = "../../modules/s3"
  s3_bucket_name = var.s3_bucket_name
  s3_versioning  = var.s3_versioning
  force_destroy  = var.force_destroy
  environment    = var.environment
}
