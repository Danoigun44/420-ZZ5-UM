 

#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{ 
  webapp2_names=["k8webapp06","k9webapp06","k10webapp06","k11webapp06","k12webapp06"]
}
resource "azurerm_resource_group" "regazgroup" {
  name     = "regazgroup"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "planabcd" {
  for_each            = {for plan in local.webapp2_names: plan=>plan}
  name                = "${var.prefix}${each.key}"
  location            = azurerm_resource_group.regazgroup.location
  resource_group_name = azurerm_resource_group.regazgroup.name
  dns_prefix          = "dnsprefix"
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
  

