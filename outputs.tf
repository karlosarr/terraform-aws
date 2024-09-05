output "instance_private_ip" {
  description = "Private Ip of the EC2 instance(s)"
  value       = module.ec2.instance_private_ip
}
