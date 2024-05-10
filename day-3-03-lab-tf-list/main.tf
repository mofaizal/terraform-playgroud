
locals {
  fruits = ["apple", "banana", "orange"]
}

resource "null_resource" "example" {

  count = length(local.fruits)
}

output "example" {
  value = null_resource.example[*].triggers
}
