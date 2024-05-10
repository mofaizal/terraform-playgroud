variable "keys" {
  type    = list(string)
  default = ["a", "b", "c"]
}

variable "values" {
  type    = list(number)
  default = [1, 2, 3]
}

locals {
  my_map = zipmap(var.keys, var.values)
}

output "my_map_output" {
  value = local.my_map
}
