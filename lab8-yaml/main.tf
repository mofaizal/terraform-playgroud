
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}



locals {
  network = yamldecode(file("vnet.yaml"))
}

resource "azurerm_resource_group" "example" {
  name     = local.network.resource_group
  location = local.network.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.network.vnet
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [local.network.address_space]
  dynamic "subnet" {
    for_each = local.network.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.iprange
    }
  }
}
