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

  for_each = var.nsg_configurations
  name     = each.key
  location = each.value.location
}

# Create Network Security Groups and its associated rules
resource "azurerm_network_security_group" "example" {
  for_each = var.nsg_configurations

  name                = each.key
  location            = each.value.location
  resource_group_name = azurerm_resource_group.example[each.key].name

  dynamic "security_rule" {
    for_each = each.value.security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_address_prefix      = security_rule.value.source_address_prefix
      source_port_range          = security_rule.value.source_port_range
      destination_address_prefix = security_rule.value.destination_address_prefix
      destination_port_range     = security_rule.value.destination_port_range
    }
  }
  depends_on = [azurerm_resource_group.example]
}
