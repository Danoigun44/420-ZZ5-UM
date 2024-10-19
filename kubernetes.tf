#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{ 
  webapp_names=["k1webapp06","k2webapp06","k3webapp06","k4webapp06","k5webapp06"]
}
resource "azurerm_resource_group" "rg-azgroup" {
  name     = "az_resource_group"
  location = "Canadacentral"
}
resource "azurerm_kubernetes_webapp" "batchabcd" {
  for_each            = {for webapp in local.webapp_names: cluster=>cluster}
  name                = "${var.prefix}cluster"
  location            = azurerm_resource_group.rg-azgroup.location
  resource_group_name = azurerm_resource_group.rg-azgroup.name
  dns_prefix          = "exampleaks1"

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
}
/*
output "client_certificate" {
  value     = [for webapp in azurerm_kubernetes_webapp.batchabcd:webapp.kube_config.0.client_certificate]
  sensitive = true
}

output "kube_config" {
  value = [for webapp in azurerm_kubernetes_webapp.batchabcd: webapp.kube_config_raw]

  sensitive = true
}
output "kube_id"{
  value=[for webapp in azurerm_kubernetes_webapp.batchabcd:webapp.id ]
}
output "kube_name"{
  value=[for webapp in azurerm_kubernetes_webapp.batchabcd:webapp.name ]
}
*/
