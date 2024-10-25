variable "resource_group_name" {
  type    = string
  default = "mcit420zz5um-resource-group"
}

variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
}
