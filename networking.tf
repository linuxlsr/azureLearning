#VPC & subnets
resource "azurerm_virtual_network" "virtual_network_1" {
  address_space       = ["10.0.0.0/22"]
  location            = "westus"
  name                = "first_vpc"
  resource_group_name = azurerm_resource_group.first_rg.name
  tags = merge({
    Name = "first resource group" },
  local.common_tags)
}

resource "azurerm_subnet" "subnet_0" {
  name                 = "public0"
  resource_group_name  = azurerm_resource_group.first_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefix       = var.public0
}

resource "azurerm_subnet" "subnet_1" {
  name                 = "public1"
  resource_group_name  = azurerm_resource_group.first_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefix       = var.public1
}

resource "azurerm_subnet" "subnet_2" {
  name                 = "private2"
  resource_group_name  = azurerm_resource_group.first_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefix       = var.private2
}

resource "azurerm_subnet" "subnet_3" {
  name                 = "private3"
  resource_group_name  = azurerm_resource_group.first_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefix       = var.private3
}

# IGW & route table, routes for public, private
//resource "azurerm_virtual_network_gateway" "igw" {
//  location            = "westus"
//  name                = "${var.application}_gateway"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  sku                 = "Basic"
//  type                = "Vpn"
//
//  ip_configuration {
//    subnet_id = ""
//  }
//}
