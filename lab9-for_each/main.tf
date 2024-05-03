
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


resource "azurerm_resource_group" "example" {
  name     = local.name
  location = local.location
}

resource "azurerm_virtual_network" "vnets" {
  for_each = local.vnets

  name                = each.key
  address_space       = [each.value]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
