data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_network_interface" "network" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = var.private_ips

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "primary_network_interface"
  }
}

resource "aws_instance" "vm" {
  ami                         = data.aws_ami.ubuntu.id # us-west-2
  instance_type               = var.instance_type
  associate_public_ip_address = false
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = 0.0035
    }
  }
  network_interface {
    network_interface_id = aws_network_interface.network.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "ubuntu-instance"
  }
}

resource "aws_key_pair" "tf_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "tf_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.file_name
}

resource "local_file" "tf_key_pem" {
  content  = tls_private_key.rsa.public_key_pem
  filename = "${var.file_name}.pem"
}
