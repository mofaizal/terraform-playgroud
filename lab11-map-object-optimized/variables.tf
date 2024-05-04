
variable "vnets" {
  type = map(object({
    address_prefix = string
    location       = string
    resource_group = string
  }))

}
