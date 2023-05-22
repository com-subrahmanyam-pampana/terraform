
# To init the providers

terraform init

# To create the resources
terraform apply
This command will create the resources
# To destroy the resources
terraform destroy

# Plan
terraform plan

This will not create the resources.it gives us the list of resources that are going to be created 

terraform plan -out myplan.terraform
To create the resources from the pla file
terraform apply "myplan.terraform" 