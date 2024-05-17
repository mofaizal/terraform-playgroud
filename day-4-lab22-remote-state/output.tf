output "rg_details" {
  value = azurerm_resource_group.rg
}

output "location" {
  value = azurerm_resource_group.rg.location

}

output "vnets" {
  value = azurerm_virtual_network.vnets

}
