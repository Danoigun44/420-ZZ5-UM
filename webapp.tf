
# Resource Groups
resource "azurerm_resource_group" "rg_canada_east" {
  name     = "rg-webapp-canadaeast"
  location = "canadaeast"
}

resource "azurerm_resource_group" "rg_canada_central" {
  name     = "rg-webapp-canadacentral"
  location = "canadacentral"
}


resource "azurerm_app_service_plan" "plan_canada_east" {
  name                = "appserviceplan-canadaeast"
  location            = azurerm_resource_group.rg_canada_east.location
  resource_group_name = azurerm_resource_group.rg_canada_east.name
    sku_name            = "P1v2"
  os_type             = "Windows"
}
/*
resource "azurerm_app_service_plan" "plan_canada_central" {
  name                = "appserviceplan-canadacentral"
  location            = azurerm_resource_group.rg_canada_central.location
  resource_group_name = azurerm_resource_group.rg_canada_central.name
    sku_name            = "P1v2"
  os_type             = "Windows"
}

# Web Apps
resource "azurerm_app_service" "webapp_canada_east" {
  name                = "my-webapp-canadaeast"
  location            = azurerm_resource_group.rg_canada_east.location
  resource_group_name = azurerm_resource_group.rg_canada_east.name
  app_service_plan_id = azurerm_app_service_plan.plan_canada_east.id
site_config {}

}

resource "azurerm_app_service" "webapp_canada_central" {
  name                = "my-webapp-canadacentral"
  location            = azurerm_resource_group.rg_canada_central.location
  resource_group_name = azurerm_resource_group.rg_canada_central.name
  app_service_plan_id = azurerm_app_service_plan.plan_canada_central.id
site_config {}
}
*/
