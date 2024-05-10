locals {
  name                  = "example-rg"
  location              = "southeast asia"
  vnet_name             = ["vnet1", "vnet2", "vnet3"]
  vnet_address_prefixes = ["10.200.0.0/16", "10.201.0.0/16", "10.202.0.0/16"]
  vnets                 = zipmap(var.vnet_names, var.vnet_address_prefixes)
}
