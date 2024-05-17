variable "vnets" {
  type = map(object({
    address_space = string
    subnets = map(object({
      name           = string
      address_prefix = string
    }))
  }))
}
