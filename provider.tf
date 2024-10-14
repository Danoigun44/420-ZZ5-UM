
terraform{
  required_providers{
    azurerm={
      source="hashicorp/azurerm"
      version= ">=3.70.0"#this version is for azurerm, NOT terraform version
    }
  }
  required_version=">=1.4.0"#this version is for Terraform Version, NOT azurerm
}

provider "azurerm"{
  features{}
  skip_provider_registration="true"
  
  subscription_id=var.ecf831bb-9d6c-410f-ba46-1a620639498b
  client_id=var.cb593eaa-b094-4dbf-b52e-316a5aa247a7
  client_secret=var.-qC8Q~sUG2_nUpZqemiRHzUbs8kU8Qu1J~Q1pbRi
  tenant_id=var.0ebdf2d5-6a77-45d3-b758-a500afb0460d
