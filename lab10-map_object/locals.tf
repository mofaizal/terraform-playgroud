locals {
  default = {
    vnet1 = {
      address_prefix = "10.1.0.0/16"
      location       = "East US"
      resource_group = "rg_east_us"
    }
    vnet2 = {
      address_prefix = "10.2.0.0/16"
      location       = "West US"
      resource_group = "rg_west_us"
    }
    vnet3 = {
      address_prefix = "10.3.0.0/16"
      location       = "North Europe"
      resource_group = "rg_north_europe"
    }
  }
  resource_groups = distinct([for vnet in var.vnets : vnet.resource_group])
}
