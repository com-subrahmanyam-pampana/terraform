3 Ways to Configure  AWS

# Method1 :Embed credentials directly into the Terraform template file
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = "your_aws_access_key"
    secret_key = "your_aws_secret_access_key"
}
In the above main.tf file, you can simply add your AWS account’s credentials in the access_key and secret_key properties which Terraform would use when connecting to your AWS account.

Of course, this approach is the fastest and the least secure way to achieve our goal. It is almost never a good idea to store your credentials in a an unencrypted text file like this, and this is especially BAD if you do so and check the file into version control like git.

# Method 2:Leverage Terminal Environment Variables
The Terraform CLI is designed to detect the presence of the following environment variables in the current terminal session:
export AWS_ACCESS_KEY_ID=your_aws_access_key
export AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key

# 3 Shared Credentials File

The third approach is to store these credentials in a credentials file in the local file system.

The AWS Terraform provider can be configured to use this file using the shared_credentials_file attribute:

terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "/path/to/aws_credentials"
}