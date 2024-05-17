terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.1.0"
    }
  }
}

resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}


provider "azurerm" {
  features {

  }
}

module "resource-group" {
  source   = "../modules/resource-group"
  rg_name  = "tf-moudle-rg-${random_string.random.result}"
  location = "West US"
}

module "storage-account" {
  source                   = "../modules/storage-account"
  storage_name             = "module-${random_string.random.result}"
  rg_name                  = module.resource-group.rg_details.name
  storage_account_type     = "Standard"
  account_replication_type = "LRS"
  location                 = "West US"
}

