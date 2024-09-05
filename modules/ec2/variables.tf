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
variable "private_subnets" {}
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
