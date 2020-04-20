#VPC & subnets
resource "azurerm_virtual_network" "virtual_network_1" {
  address_space       = [var.vpc_cidr]
  location            = "westus"
  name                = "first_vpc"
  resource_group_name = azurerm_resource_group.first_rg.name
  tags = merge({
    Name = "first resource group" },
  local.common_tags)
}

resource "azurerm_subnet" "fw_subnet" {
  address_prefix       = var.firewall_subnet
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.first_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
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

resource "azurerm_subnet" "subnet_4" {
  name                 = "private4"
  resource_group_name  = azurerm_resource_group.first_rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefix       = var.private4
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

# IPs
resource "azurerm_public_ip" "vm_ip" {
  location            = var.location
  name                = "${var.application}_${var.environment}_test_vm_ip"
  resource_group_name = azurerm_resource_group.first_rg.name
  allocation_method   = "Static"
  tags = merge({
    Name = "test ip" },
  local.common_tags)
}

resource "azurerm_public_ip" "storage_ip" {
  location            = var.location
  name                = "${var.application}_${var.environment}_storage_ip"
  resource_group_name = azurerm_resource_group.first_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = merge({
    Name = "storage ip" },
  local.common_tags)
}