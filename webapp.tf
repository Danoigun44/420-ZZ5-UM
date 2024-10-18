provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG-420-ZZZ-UM" {
  name     = "420-ZZZ-UM-resources"
  location = "Canadacentral"
}

resource "azurerm_service_plan" "service-plan" {
  name                = "420-ZZZ-UM-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp1" {
  name                = "webapp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}
