terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# data "azurerm_resource_group" "exercise1" {
#   name = "Terraform-Exercise"
# }

variable "vnet_details" {
  description = "Details of the VNETs and their subnets"
  type = map(object({
    address_space = list(string)
    subnets = list(object({
      name    = string
      newbits = number
      netnum  = number
    }))
  }))

  default = {
    hubvnet = {
      address_space = ["10.1.0.0/16"]
      subnets = [
        { name = "WebSubnet", newbits = 8, netnum = 1 },
        { name = "AppsSubnet", newbits = 8, netnum = 2 }
      ]
    }
    spokevnet = {
      address_space = ["10.2.0.0/16"]
      subnets = [
        { name = "WebSubnet", newbits = 8, netnum = 1 },
        { name = "AppsSubnet", newbits = 8, netnum = 2 }
      ]
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "cloud-resources-rg"
  location = "central india"
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet_details

  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = each.value.address_space
}

locals {
  flat_subnets = flatten([
    for vnet, details in var.vnet_details : [
      for subnet in details.subnets : {
        vnet_name   = vnet
        subnet_name = subnet.name
        newbits     = subnet.newbits
        netnum      = subnet.netnum
      }
    ]
  ])
}

resource "azurerm_subnet" "subnet" {
  for_each = { for subnet in local.flat_subnets : "${subnet.vnet_name}-${subnet.subnet_name}" => subnet }

  name                 = each.value.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.vnet_name].name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.vnet[each.value.vnet_name].address_space[0], each.value.newbits, each.value.netnum)]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


resource "azurerm_subnet" "gatewaysubnet" {

  name                 = gatewaysubnet
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = "hubvnet"
  address_prefixes     = "10.1.3.0/27"

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


# 
