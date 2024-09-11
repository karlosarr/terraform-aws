# AMI
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
#Network interface
resource "aws_network_interface" "network" {
  subnet_id   = var.private_subnets.id
  private_ips = var.private_ips

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "primary_network_interface"
  }
}
#Virtual machine ec2
resource "aws_instance" "vm" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  network_interface {
    network_interface_id = aws_network_interface.network.id
    device_index         = 0
  }

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "ubuntu-instance"
  }
}
#key pair SH
resource "aws_key_pair" "tf_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.rsa.public_key_openssh
}
#Private key RSA
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Save private key
resource "local_file" "tf_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.file_name
}
# Save public key
resource "local_file" "tf_key_pem" {
  content  = tls_private_key.rsa.public_key_pem
  filename = "${var.file_name}.pem"
}
