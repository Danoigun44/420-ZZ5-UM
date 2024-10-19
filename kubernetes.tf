#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{ 
  cluster_names=["k1batcha06","k2batcha06","k3batcha06","k4batcha06","k5batcha06"]
}
resource "azurerm_resource_group" "rg-azgroup" {
  name     = "az_resource_group"
  location = "Canadacentral"
}
resource "azurerm_kubernetes_cluster" "batchabcd" {
  for_each            = {for cluster in local.cluster_names: cluster=>cluster}
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
  value     = [for cluster in azurerm_kubernetes_cluster.batchabcd:cluster.kube_config.0.client_certificate]
  sensitive = true
}

output "kube_config" {
  value = [for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config_raw]

  sensitive = true
}
output "kube_id"{
  value=[for cluster in azurerm_kubernetes_cluster.batchabcd:cluster.id ]
}
output "kube_name"{
  value=[for cluster in azurerm_kubernetes_cluster.batchabcd:cluster.name ]
}
*/
