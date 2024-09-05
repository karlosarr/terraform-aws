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
  type = bool
}
variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}