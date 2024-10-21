
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
