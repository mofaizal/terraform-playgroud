# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0.2"
#     }
#   }

#   required_version = ">= 1.1.0"
# }

# provider "azurerm" {
#   features {}
# }


# resource "azurerm_resource_group" "example" {

#   for_each = var.nsg_configurations
#   name     = each.key
#   location = each.value.location
# }

# # Create Network Security Groups
# resource "azurerm_network_security_group" "example" {
#   for_each = var.nsg_configurations

#   name                = each.key
#   location            = each.value.location
#   resource_group_name = azurerm_resource_group.example[each.key].name
#   depends_on          = [azurerm_resource_group.example]
# }


# resource "azurerm_network_security_rule" "example" {
#   # for_each = {
#   #   for idx, nsg_config in var.nsg_configurations : idx => nsg_config
#   # }
#   name                        = "rule-${each.key}"
#   priority                    = each.value.priority
#   direction                   = each.value.direction
#   access                      = each.value.access
#   protocol                    = each.value.protocol
#   source_address_prefix       = each.value.source_address_prefix
#   source_port_range           = each.value.source_port_range
#   destination_address_prefix  = each.value.destination_address_prefix
#   destination_port_range      = each.value.destination_port_range
#   resource_group_name         = azurerm_resource_group.example[each.key].name
#   network_security_group_name = azurerm_network_security_group.example[each.key].name
#   depends_on                  = [azurerm_resource_group.example, azurerm_network_security_group.example]
# }
