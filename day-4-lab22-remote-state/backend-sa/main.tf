
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

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "stroageaccount" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.rg]
}

resource "azurerm_storage_container" "example" {
  name                  = "network-terraform-state"
  storage_account_name  = azurerm_storage_account.stroageaccount.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "vm_state" {
  name                  = "vm-terraform-state"
  storage_account_name  = azurerm_storage_account.stroageaccount.name
  container_access_type = "private"
}
