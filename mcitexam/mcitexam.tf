# Resource Group for both VMs and WAF Policies
resource "azurerm_resource_group" "exrgrp" {
  name     = "exrgrp-resource-group"
  location = "canadacentral"
}

# Virtual Network for VMs
resource "azurerm_virtual_network" "exrgrp_vnet" {
  name                = "exrgrp-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.exrgrp.location
  resource_group_name = azurerm_resource_group.exrgrp.name
}

# Subnet for VMs
resource "azurerm_subnet" "exrgrp_subnet" {
  name                 = "exrgrp-subnet"
  resource_group_name  = azurerm_resource_group.exrgrp.name
  virtual_network_name = azurerm_virtual_network.exrgrp_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interfaces for VMs
resource "azurerm_network_interface" "exrgrp_nic" {
  for_each            = toset(local.vms)
  name                = "${each.value}-nic"
  location            = azurerm_resource_group.exrgrp.location
  resource_group_name = azurerm_resource_group.exrgrp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.exrgrp_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machines using for_each loop
resource "azurerm_linux_virtual_machine" "exrgrp_vm" {
  for_each            = toset(local.vms)

  name                = each.value
  resource_group_name = azurerm_resource_group.exrgrp.name
  location            = azurerm_resource_group.exrgrp.location
  size                = "Standard_B1ms"

  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.example_nic[each.value].id
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
