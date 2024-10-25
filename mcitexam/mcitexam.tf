# Resource Group for both VMs and WAF Policies
resource "azurerm_resource_group" "regazgroup" {
  name     = "regazgroup-resource-group"
  location = "canadacentral"
}

# Virtual Network for VMs
resource "azurerm_virtual_network" "exrgrp_vnet" {
  name                = "regazgroup-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.regazgroup.location
  resource_group_name = azurerm_resource_group.regazgroup.name
}

# Subnet for VMs
resource "azurerm_subnet" "regazgroup_subnet" {
  name                 = "regazgroup-subnet"
  resource_group_name  = azurerm_resource_group.regazgroup.name
  virtual_network_name = azurerm_virtual_network.regazgroup_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interfaces for VMs
resource "azurerm_network_interface" "regazgroup_nic" {
  for_each            = toset(local.vms)
  name                = "${each.value}-nic"
  location            = azurerm_resource_group.regazgroup.location
  resource_group_name = azurerm_resource_group.regazgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.regazgroup_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machines using for_each loop
resource "azurerm_linux_virtual_machine" "regazgroup_vm" {
  for_each            = toset(local.vms)

  name                = each.value
  resource_group_name = azurerm_resource_group.regazgroup.name
  location            = azurerm_resource_group.regazgroup.location
  size                = "Standard_B1ms"

  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.regazgroup_nic[each.value].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    name              = "${each.value}_osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
# WAF Policies using for_each loop
resource "azurerm_web_application_firewall_policy" "regazgroup_waf" {
  for_each            = local.waf_policies

  name                = each.key
  resource_group_name = azurerm_resource_group.regazgroup.name
  location            = azurerm_resource_group.regazgroup.location

  custom_rules {
    name      = "AllowRule"
    priority  = 1
    action    = "Allow"

    match_conditions {
      match_variables {
        variable_name = "RemoteAddr"
      }

      operator = "IPMatch"
      values   = ["1.2.3.4"] # Example IP to match, change as needed
    }
  }

  managed_rules {
    rule_set_type    = "OWASP"
    rule_set_version = "3.2"
  }
}

