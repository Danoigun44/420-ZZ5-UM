 

#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{ 
  webapp2_names=["k8webapp06","k9webapp06","k10webapp06","k11webapp06","k12webapp06"]
}
resource "azurerm_resource_group" "reg-az-group" {
  name     = "reg_az_group"
  location = "Canada Central"
}

resource "azurerm_service_plan" "planabcd" {
  for_each            = {for plan in var.classworkclusters: cluster=>cluster}
  name                = "${var.prefix}${each.key}"
  location            = azurerm_resource_group.reg-az-group.location
  resource_group_name = azurerm_resource_group.reg-az-group.name
  dns_prefix          = var.dnsprefix
}
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }

