variable "vnets" {
  type = map(object({
    address_space = string
  }))
}
