variable "vnet_details" {
  description = "Details of the VNETs and their subnets"
  type = map(object({
    address_space = list(string)
    subnets = list(object({
      name    = string
      newbits = number
      netnum  = number
    }))
  }))

  default = {
    vnet1 = {
      address_space = ["10.1.0.0/16"]
      subnets = [
        { name = "WebSubnet", newbits = 8, netnum = 1 },
        { name = "AppsSubnet", newbits = 8, netnum = 2 }
      ]
    }
    vnet2 = {
      address_space = ["10.2.0.0/16"]
      subnets = [
        { name = "WebSubnet", newbits = 8, netnum = 1 },
        { name = "AppsSubnet", newbits = 8, netnum = 2 }
      ]
    }
  }
}
