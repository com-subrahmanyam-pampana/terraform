
variable "instance_name" {
  type = string
  default = "My EC2 instance"
}
variable "ami" {
  type = string
  default  = "ami-0742b4e673072066f"
}

variable "instance_type" {
  type =string
  default  = "t2.micro"
}