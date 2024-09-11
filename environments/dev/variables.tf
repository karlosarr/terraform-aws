variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
#------------------
#VPC Variables
#------------------
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
#------------------
#EC2 Variables
#------------------
variable "instance_type" {
  type        = string
  description = "Instance Type for EC2"
  default     = "t3.micro"
}
variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}
variable "private_ips" {
  type        = list(string)
  description = "Private IP for EC2"
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
#--------------
# s3 Variables
#--------------
variable "s3_bucket_name" {
  description = "Name of bucket that holds the state file"
  type        = string
}

variable "s3_versioning" {
  description = "Versioning for bucket"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy the bucket"
  type        = bool
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}