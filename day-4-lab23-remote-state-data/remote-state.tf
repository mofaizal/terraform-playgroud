# Terraform Remote State Datasource
data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "faitfstatesa"
    container_name       = "network-terraform-state"
    key                  = "terraform.tfstate"
  }
}

