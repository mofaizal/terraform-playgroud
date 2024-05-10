variable "team_members" {
  type = map(object({
    name = string
    age  = number
    location = object({
      city = string
    })
  }))
  default = {
    "Alice" = {
      name = "Alice"
      age  = 30
      location = {
        city = "New York"
      }
    },
    "Bob" = {
      name = "Bob"
      age  = 25
      location = {
        city = "San Francisco"
      }
    }
  }
}

resource "null_resource" "example" {
  for_each = var.team_members

  # Just a dummy resource to use for_each
  triggers = {
    name = each.value["name"]
    age  = each.value["age"]
    city = each.value["location"]["city"]
  }
}
