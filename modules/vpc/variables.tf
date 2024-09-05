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
variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}