
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"

  # Terraform State Storage to Azure Storage and Container (this must be part tf provider block)
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "faitfstatesa"
    container_name       = "network-terraform-state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# data "azurerm_resource_group" "rg_details" {
#   name = "data_block_rg"
# }

locals {
  name     = "data_block_rg"
  location = "southeast asia"
}

resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = local.location
}
resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets

  name                = each.key
  address_space       = [each.value.address_space]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dynamic "subnet" {
    for_each = each.value.subnets

    content {
      name           = subnet.key
      address_prefix = subnet.value.address_prefix
    }
  }
}
