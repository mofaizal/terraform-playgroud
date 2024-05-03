#What is Terraform Output Value

Output values make information about your infrastructure available on the command line, and can expose information for other Terraform configurations to use. Output values are similar to return values in programming languages.


Here's how Terraform output value are used in Terraform with an Azure example:

Output values have several uses:

- A child module can use outputs to expose a subset of its resource attributes to a parent module.
- A root module can use outputs to print certain values in the CLI output after running terraform apply.
- When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source.
- Resource instances managed by Terraform each export attributes whose values can be used elsewhere in configuration. Output values are a way to expose some of that information to the user of your module.

```terraform

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "resource_group_location" {
  value = azurerm_resource_group.example.location
}

output "name" {
  value = azurerm_resource_group.example.name

}
```

```
# Output block for the admin_password
output "admin_password" {
  value     = azurerm_virtual_machine.example.admin_password
  sensitive = true  # Marks the output as sensitive
}

```