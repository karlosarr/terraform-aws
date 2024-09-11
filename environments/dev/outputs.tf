output "instance_private_ip" {
  description = "Private Ip of the EC2 instance(s)"
  value       = module.ec2.instance_private_ip
}

output "kms_key" {
  description = "The KMS customer master key to encrypt state buckets."
  value       = module.s3.kms_key
}
