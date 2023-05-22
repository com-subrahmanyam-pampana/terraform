variable "my_map_var" {
    type= map(string)
    default = {
        mykey1= "my value 1",
        mykey2= "my value 2"
    }
}
#  To run
# type "terraform console" in the console.It will give the teraform console
# Then type var.my_map_var or "${var.my_map_var}"