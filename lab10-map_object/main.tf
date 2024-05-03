
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


resource "azurerm_resource_group" "resource_groups" {
  for_each = { for rg in local.resource_groups : rg => rg }

  name     = each.value.resource_group
  location = each.value.location
}

resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets

  name                = each.key
  address_space       = [each.value.address_prefix]
  location            = each.value.location
  resource_group_name = azurerm_resource_group.resource_groups[each.value.resource_group].name
}


