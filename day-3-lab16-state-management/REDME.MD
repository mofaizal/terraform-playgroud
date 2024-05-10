

```

terraform show
terraform state list 
terraform state list | grep '^azurerm_resource_group'
terraform state list | grep 'vnet1' 

terraform state show azurerm_virtual_network.vnets\[\"vnet1\"\]

// Action Delete VNET from Stat file  

terraform state rm azurerm_virtual_network.vnets\[\"vnet1\"\]

terraform refresh 

terraform plan -refresh-only   

// importing existing resources / update deleted resources

terraform import azurerm_virtual_network.vnets\[\"vnet1\"\] "/subscriptions/acf4d45f-adcb-4d8b-95e7-a980b37d9b6b/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/vnet1"

// Now go and Add subnet to vnet and use 

terraform init
terraform plan --refresh-only   
terraform apply --refresh-only

terraform apply 


```