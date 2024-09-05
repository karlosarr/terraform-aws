output "instance_private_ip" {
  description = "Private Ip of the EC2 instance(s)"
  value = aws_instance.vm.private_ip
}