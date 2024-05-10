
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

data "azurerm_resource_group" "rg_details" {
  name = "data_block_rg"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location            = data.azurerm_resource_group.rg_details.location
  address_space       = ["10.90.0.0/16"] # address space for VNET 
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = data.azurerm_resource_group.rg_details.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.90.0.0/24"]
  depends_on           = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = data.azurerm_resource_group.rg_details.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.90.1.0/24"]
  depends_on           = [azurerm_virtual_network.vnet]
}

# Required for to deploy VMSS and Web Server to host application
resource "azurerm_subnet" "workload" {
  name                 = "workload"
  resource_group_name  = data.azurerm_resource_group.rg_details.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.90.2.0/24"]
  depends_on           = [azurerm_virtual_network.vnet]
}

# Create Network Security Group (NSG)
resource "azurerm_network_security_group" "ag_subnet_nsg" {
  name                = "ag_subnet_nsg"
  resource_group_name = data.azurerm_resource_group.rg_details.name
  location            = data.azurerm_resource_group.rg_details.location
  depends_on          = [azurerm_virtual_network.vnet]
}


## NSG Inbound Rule for Azure Application Gateway Subnets
resource "azurerm_network_security_rule" "ag_nsg_rule_inbound" {
  for_each                    = local.ag_inbound_ports_map
  name                        = "Rule-Port-${each.value.destination_port}-${each.value.access}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = each.value.access
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value.destination_port
  source_address_prefix       = each.value.source_address
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.rg_details.name
  network_security_group_name = azurerm_network_security_group.ag_subnet_nsg.name
  depends_on                  = [azurerm_virtual_network.vnet]
}

# Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "ag_subnet_nsg_associate" {
  depends_on = [azurerm_network_security_rule.ag_nsg_rule_inbound]
  # Every NSG Rule Association will disassociate NSG from Subnet and Associate it, so we associate it only after NSG is completely created 
  #- Azure Provider Bug https://github.com/terraform-providers/terraform-provider-azurerm/issues/354  
  subnet_id                 = azurerm_subnet.workload.id
  network_security_group_id = azurerm_network_security_group.ag_subnet_nsg.id

}
