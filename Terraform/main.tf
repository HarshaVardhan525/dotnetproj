terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfbackend"
    storage_account_name = "quickcartsa"
    container_name       = "qcterraform"
    key                  = "quickcart.terraform.tfstate"
  }
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
  
}

resource "azurerm_service_plan" "asp" {
    name = var.asp_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    os_type = "Windows"
    sku_name = "B1"
  
}


resource "azurerm_windows_web_app" "qcwebapp" {
  name                = var.app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = false
  } 
}