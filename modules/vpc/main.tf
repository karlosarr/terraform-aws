resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "vpc-defaut"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "Private Subnet default"
  }
}
