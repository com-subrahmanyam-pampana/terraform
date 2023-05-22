


├── main.tf
|── output.tf 
├── modules
│   └── aws_ec2
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf


All modules are saved in the "modules" folder.In this folder we have modules aws_ec2,aws_s3

# Run this command inside the root module
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy