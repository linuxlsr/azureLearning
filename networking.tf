#VPC & subnets
resource "azurerm_virtual_network" "virtual_network_1" {
  address_space       = ["10.0.0.0/22"]
  location            = "westus"
  name                = "first-vpc"
  resource_group_name = azurerm_resource_group.first_rg.name

  subnet {
    name           = "public0"
    address_prefix = var.public0
  }

  subnet {
    name           = "public1"
    address_prefix = var.public1
  }

  subnet {
    name           = "private2"
    address_prefix = var.private2
  }

  subnet {
    name           = "private3"
    address_prefix = var.private3
  }

  tags = merge({
    Name = "first resource group"},
  local.common_tags)
}

# IGW & route table, routes for public, private
resource "azurerm_virtual_network_gateway" "igw" {
  location = "westus"
  name = "${var.application}=gateway"
  resource_group_name = azurerm_resource_group.first_rg.name
  sku = "Basic"
  type = "Vpn"

  ip_configuration {
    subnet_id = ""
  }
}
