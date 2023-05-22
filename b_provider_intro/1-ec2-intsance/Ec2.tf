
#Don't save the acesss key publicly.It is danger to store.
provider "aws" {
  # Add your AWS keys in you machine.This is the most secure way 
  # access_key = "YOUR_ACCESS_KEY"
  # secret_key = "YOUR_SECRET_KEY"
  region     = "us-east-1"
}
resource "aws_instance" "my_first_ec2_instance" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
}

