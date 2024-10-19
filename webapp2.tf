 
  webapp_names=["k8webapp06","k9webapp06","k10webapp06","k11webapp06","k12webapp06"]

resource "azurerm_resource_group" "rg-az-group" {
  name     = "rg_az_group"
  location = "CanadaCentral"
}

resource "azurerm_webapp_cluster" "batchabcde" {
  for_each            = {for cluster in var.classworkclusters: cluster=>cluster}
  name                = "${var.prefix}${each.key}"
  location            = azurerm_resource_group.rg-az-group.location
  resource_group_name = azurerm_resource_group.rg-az-group.name
  dns_prefix          = var.dnsprefix
  service_plan_id = azurerm_service_plan.plan_service.id
}

 
resource "azurerm_service_plan" "plan_service" {
 for_each            = {for cluster in var.classworkclusters: cluster=>cluster}
 name                = "${var.prefix}${each.key}"
  location            = azurerm_resource_group.rg-az-group.location
  resource_group_name = azurerm_resource_group.rg-az-group.name
    sku_name            = "P1v2"
  os_type             = "Windows"
site_config {}
}


#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{ 
  cluster_names=["k8webapp06","k9webapp06","k10webapp06","k11webapp06","k12webapp06"]
}
resource "azurerm_resource_group" "rg-az-group" {
  name     = "rg_az_group"
  location = "Canada Central"
}

resource "azurerm_service_plan" "planabcd" {
  for_each            = {for plan in var.classworkclusters: cluster=>cluster}
  name                = "${var.prefix}${each.key}"
  location            = azurerm_resource_group.rg-az-group.location
  resource_group_name = azurerm_resource_group.rg-az-group.name
  dns_prefix          = var.dnsprefix

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

output "client_certificate" {
  value     = [for cluster in azurerm_kubernetes_cluster.batchabcd:cluster.kube_config.0.client_certificate]
  sensitive = true
}

output "kube_config" {
  value = [for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config_raw]

  sensitive = true
}
