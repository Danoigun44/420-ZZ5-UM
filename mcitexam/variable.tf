variable "resource_group_name" {
  type    = string
  default = "mcit420zz5um-resource-group"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "mcit-exam-rg"
}

variable "vm_names" {
  description = "List of virtual machine names"
  default     = ["mcitexamvm1", "mcitexamvm2", "mcitexamvm3", "mcitexamvm4", "mcitexamvm5"]
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  default     = "Password1234!"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  default     = "Standard_DS1_v2"
}


variable "foods" {
  description = "List of foods"
  type        = list(string)
  default     = ["rice", "beans", "bread", "fish", "chicken"]
}
