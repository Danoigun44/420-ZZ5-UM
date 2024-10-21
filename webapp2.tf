 

#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{ 
  webapp2_names=["k8webapp06","k9webapp06","k10webapp06","k11webapp06","k12webapp06"]
}
resource "azurerm_resource_group" "regazgroup" {
  name     = "regazgroup"
  location = "Canadacentral"
}

resource "azurerm_kubernetes_cluster" "planabcd" {
  for_each            = {for plan in local.webapp2_names: cluster=>cluster}
  name                = "${var.prefix}${each.key}"
  location            = azurerm_resource_group.regazgroup.location
  resource_group_name = azurerm_resource_group.regazgroup.name
  
}
