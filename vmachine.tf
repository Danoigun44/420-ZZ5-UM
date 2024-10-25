# Create a resource group
resource "azurerm_resource_group" "mcit420zz5um" {
  name     = var.resource_group_name
  location = var.location
}

# Create a virtual network
resource "azurerm_virtual_network" "mcit420zz5um_vnet" {
  name                = "mcit420zz5um-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
}

# Create a subnet
resource "azurerm_subnet" "mcit420zz5um_subnet" {
  name                 = "mcit420zz5um-subnet"
  resource_group_name  = azurerm_resource_group.mcit420zz5um.name
  virtual_network_name = azurerm_virtual_network.mcit420zz5um_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create network interfaces for each VM
resource "azurerm_network_interface" "mcit420zz5um_nic" {
  for_each            = var.vm_names
  name                = "${each.value}-nic"
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mcit420zz5um_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create VMs using for_each
resource "azurerm_linux_virtual_machine" "mcit420zz5um_vm" {
  for_each            = var.vm_names
  name                = each.value
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  location            = azurerm_resource_group.mcit420zz5um.location
  size                = "Standard_B1ms"

  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.mcit420zz5um_nic[each.key].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
