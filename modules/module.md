Any folder that contains a .tf file is also a module.(Also a root module)
Module:
A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module. So in this sense, every Terraform configuration is part of a module.

Root module:
When we run Terraform commands directly from a directory, it is considered the root module.

Child module:
A module that is called by another configuration is referred to as a child module.

Calling module:
Terraform commands will only directly use the configuration files in one directory, which is usually the current working directory. However, our configuration can use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.

source argument:
When calling a module, the source argument is required. Terraform may search for a module in the Terraform registry that matches the given string. We could also use a URL or local file path for the source of our modules.

passing variables to a module:
When calling a module, we may want to pass variables to the module. This is usually done in the module directive block.
