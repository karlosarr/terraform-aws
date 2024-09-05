variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "vpc_cidr_block" {
  type        = string
  description = ""
  default     = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  type        = string
  description = ""
  default     = "10.0.0.0/24"
}
variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}
variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}
variable "private_ips" {
  type        = list(string)
  description = ""
  default     = ["10.0.0.1"]
}
#------------------
#Key Pair Variables
#------------------
variable "key_pair_name" {
  description = "Key Pair for ssh access to instance"
  type        = string
}

variable "file_name" {
  description = "Name of the key pair file"
  type        = string
}
