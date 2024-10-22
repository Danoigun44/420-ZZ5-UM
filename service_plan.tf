resource "azurerm_service_plan" "service_plan" {
  name                = "serviceplan"
  resource_group_name = azurerm_resource_group.regazgroup.name
  location            = azurerm_resource_group.regazgroup.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}
