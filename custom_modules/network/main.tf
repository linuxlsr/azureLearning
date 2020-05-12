data "azurerm_resource_group" "network" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.tags
  ddos_protection_plan {
    enable = true
    id = azurerm_network_ddos_protection_plan.basic.id
  }
}

resource "azurerm_network_ddos_protection_plan" "basic" {
  location = var.location
  name = "basic_ddos_plan"
  resource_group_name = data.azurerm_resource_group.network.name
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  address_prefixes     = [var.subnet_prefixes[count.index]]
  name                 = var.subnet_names[count.index]
  resource_group_name  = data.azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
