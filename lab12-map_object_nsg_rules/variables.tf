variable "nsg_configurations" {
  type = map(object({
    location = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_address_prefix      = string
      source_port_range          = string
      destination_address_prefix = string
      destination_port_range     = string
    }))
  }))
}
