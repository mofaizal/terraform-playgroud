
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


resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets

  name                = each.key
  address_space       = [each.value.address_prefix]
  location            = data.azurerm_resource_group.rg_details.location
  resource_group_name = data.azurerm_resource_group.rg_details.name
}


