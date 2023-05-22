provider "aws" {
  region     = "us-east-1"
}
#Don't save the acesss key publicly.It is danger to store.
resource "aws_instance" "my_first_ec2_instance" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "subbup-s3" {
  bucket = "superdev-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform{
  backend "s3"{
    bucket ="superdev-qa-tf-state"
    key ="qa/terraform.tfstate"
    region ="us-east-2"
    encrypt        = true
  }
}

