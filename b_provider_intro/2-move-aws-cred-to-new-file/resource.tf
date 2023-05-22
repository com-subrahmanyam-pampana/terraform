resource "aws_instance" "my_first_ec2_instance" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
}