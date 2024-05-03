
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

resource "random_string" "random" {
  length  = 4
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "${local.name}-${random_string.random.result}"
  location = local.location
}

resource "azurerm_storage_account" "stroageaccount" {
  name                     = "${local.storage_account_name}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
