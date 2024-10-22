
resource "azurerm_app_service_plan" "webapp2plan" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.regazgroup.location
  resource_group_name = azurerm_resource_group.regazgroup.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
