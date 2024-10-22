
resource "azurerm_app_service_plan" "webapp2plan" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.webapp2.location
  resource_group_name = azurerm_resource_group.webapp2.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
