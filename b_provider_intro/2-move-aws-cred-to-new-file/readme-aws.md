As AWS creds are confid,we can move to a new file.Add them in git ignore.
vars.tf=We will define all our varibles
provider.tf=define our provider(AWS) and assign the key and secret
resource.tf=defien our resources
Craete a new file with 
touch terraform.tfvars
This file must be added to git ignore
aws_access_key=<your key>
aws_secret_key=<your key>