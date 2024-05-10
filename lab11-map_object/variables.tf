
variable "vnets" {
  type = map(object({
    address_prefix = string
    location       = string
    resource_group = string
  }))

}

variable "resource_groups" {
  type = map(object({
    location = string
    name     = string
  }))


}
