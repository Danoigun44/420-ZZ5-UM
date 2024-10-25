
resource "azurerm_linux_virtual_machine" "Virtualmachines"{
  for_each = var.vm_names
  name = each.value
 resource_group_name = azurerm_resource_group.mcit420zz5um.name
}
resource "azurerm_resource_group" "rgvms" {
  name     = "rgvms-resources"
  location = "canadacentral"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
}

resource "azurerm_subnet" "example" {
  name                 = "mcitexam-subnet"
  resource_group_name  = azurerm_resource_group.mcit420zz5um.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  for_each            = toset(var.vm_names)
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.mcit420zz5um.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "example" {
  for_each               = toset(var.vm_names)
  name                   = each.key
  location               = var.location
  resource_group_name = azurerm_resource_group.mcit420zz5um.name
  network_interface_ids  = [azurerm_network_interface.example[each.key].id]
  vm_size                = var.vm_size

   storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.key
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "null_resource" "food_items" {
  for_each = toset(var.foods)

  provisioner "local-exec" {
    command = "echo 'Preparing ${each.key}'"
  }
}





resource "null_resource" "car_brands" {
  for_each = toset(var.cars)

  provisioner "local-exec" {
    command = "echo 'This is a ${each.key} car'"
  }
}


