locals {
  ag_inbound_ports_map = {
    "100" : {
      destination_port = "80",
      source_address   = "*" # Add the source address prefix here
      access           = "Allow"
    },
    "140" : {
      destination_port = "81",
      source_address   = "*" # Add the source address prefix here
      access           = "Allow"
    },
    "110" : {
      destination_port = "443",
      source_address   = "*" # Add the source address prefix here
      access           = "Allow"
    },
    "130" : {
      destination_port = "65200-65535",
      source_address   = "GatewayManager" # Add the source address prefix here
      access           = "Allow"
    }
    "150" : {
      destination_port = "8080",
      source_address   = "AzureLoadBalancer" # Add the source address prefix here
      access           = "Allow"
    }
    "4096" : {
      destination_port = "8080",
      source_address   = "Internet" # Add the source address prefix here
      access           = "Deny"
    }
  }
}
