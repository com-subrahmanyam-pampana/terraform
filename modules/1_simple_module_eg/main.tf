provider "aws" {
  region = var.aws_region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

module "aws_ec2_module" {
    source = "./modules/aws_ec2"
    instance_name="my_ec2_micro"
    ami           = "ami-0742b4e673072066f"
    instance_type = "t2.micro"
}