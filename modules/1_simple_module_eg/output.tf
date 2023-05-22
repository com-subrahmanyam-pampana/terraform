output "ec2_instance_ip_address" {
    value = module.aws_ec2_module.ec2_instance_ip_address
}

# We are accessing the output values and assigning that to value
# Syntax:module.module nmae.output of the module