variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  type        = string
  description = "Subnet CIDR"
  default     = "10.0.0.0/24"
}
variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}
variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}