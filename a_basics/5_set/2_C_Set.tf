# Set does not allow duplicate elements

variable "my_list_var" {
    type= list(number)
    default = [1,2,3]
}
#  To run
# type "terraform console" in the console.It will give the teraform console
# Then type var.my_list_var or "${var.my_list_var}"

#To acess a particular index element
# Then type var.my_list_var[1] or "${var.my_list_var[2]}"