terraform{
  required_providers{
    azurerm={
      source="registry.terraform.io/hashicorp/azurerm"
      version= ">=3.70.0"#this version is for azurerm, NOT terraform version
    }
  }
  required_version=">=1.4.0"#this version is for Terraform Version, NOT azurerm
}

provider "azurerm"{
  features{}
  
  subscription_id=var.subscription_id
  client_id=var.client_id
  Client_secret=var.Client_secret
  tenant_id=var.tenant_id
}
