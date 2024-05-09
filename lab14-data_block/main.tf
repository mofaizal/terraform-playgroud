
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg_details" {
  name = "data_block_rg"
}

resource "azurerm_storage_account" "stroageaccount" {
  name                     = local.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg_details.name
  location                 = data.azurerm_resource_group.rg_details.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
