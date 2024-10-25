
variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}
variable "countNumber"{
  type=number
  default=0
}
variable "account_tier"{
  type=string
  default="Standard"
}
variable "myname"{
  type=string
  default= "mydanoapp"
}
variable "account_replication_type"{
  type=string
  default="GRS"
}
variable "access_tier"{
  type=string
  default="Cool"
}
variable "cross_tenant_replication_enabled"{
 type=bool
 default=false
}
variable "prefix"{
 type=string
 default="mcit"
}
variable "component" {
  type    = list
  default = ["bastion", "frontproxy", "db", "infra"]
}
variable "environment"{
 type=string
 default="staging"
}
variable "list_of_string" {
type=list(string)
default= ["name","resource"]
}
variable "azurerm_resource_group1"  {
  type= string
  default="RG-420-ZZZ-UM"
}
variable "azurerm_resource_group2"{
  type= string
default= "RG-520-ZZZ-UM" 
}
variable "classworkclusters"{
  type= string
  default= "cluster"
}
variable "dnsprefix" {
   type= string
   default= "dns"
}
# Define variables for resource group, location, and VM names
variable "resource_group_name" {
  type    = string
  default = "mcit420zz5um-resource-group"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "vm_names" {
  type    = map(string)
  default = {
    vm1 = "mcitexamvm1"
    vm2 = "mcitexamvm2"
    vm3 = "mcitexamvm3"
    vm4 = "mcitexamvm4"
    vm5 = "mcitexamvm5"
  }
}
