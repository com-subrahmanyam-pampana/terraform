output "ec2_instance_ip_address" {
  value = aws_instance.my_ec2_instance.public_ip
}