resource "azurerm_resource_group" "RG-420-ZZZ-UM" {
  name     = "420-ZZZ-UM-resources"
  location = "Canadacentral"
}
resource "azurerm_resource_group" "RG-520-ZZZ-UM" {
  name     = "520-ZZZ-UM-resources"
  location = "Canadaeast"
}
resource "azurerm_service_plan" "service-plan1" {
  name                = "420-ZZZ-UM-service-plan"
  resource_group_name = azurerm_resource_group.RG-420-ZZZ-UM.name
  location            = azurerm_resource_group.RG-420-ZZZ-UM.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}
resource "azurerm_service_plan" "service-plan2" {
  name                = "520-ZZZ-UM-service-plan"
  resource_group_name = azurerm_resource_group.RG-520-ZZZ-UM.name
  location            = azurerm_resource_group.RG-520-ZZZ-UM.location
  sku_name            = "P1v2"
  os_type             = "linux"
}
resource "azurerm_windows_web_app" "webapp1" {
  name                = "webapp1"
  resource_group_name = azurerm_resource_group.RG-420-ZZZ-UM.name
  location            = azurerm_service_plan.RG-420-ZZZ-UM.location
  service_plan_id     = azurerm_service_plan.service-plan1.id

  site_config {}
}
resource "azurerm_windows_web_app" "webapp2" {
  name                = "webapp2"
  resource_group_name = azurerm_resource_group.RG-520-ZZZ-UM.name
  location            = azurerm_service_plan.RG-520-ZZZ-UM.location
  service_plan_id     = azurerm_service_plan.service-plan2.id

  site_config {}
}
