terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud { 
    
    organization = "pp74054_iac_pipeline" 

    workspaces { 
      name = "terraformCiCd" 
    } 
  } 

  required_version = ">= 1.3.0"

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "809-bf15ed99-deploy-to-azure-using-the-terraform-c"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "tfstate809bf15ed99"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Terraform"
  }

}
