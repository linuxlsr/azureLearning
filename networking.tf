#VPC & subnets

# custom network module with additional outputs. Disabled ddos plan
module "network" {
  #source              = "Azure/network/azurerm"
  source   = "./custom_modules/network"
  location = var.location
  #version             = "3.0.1"
  resource_group_name = azurerm_resource_group.first_rg.name
  vnet_name           = "mynet"
  address_space       = var.vpc_cidr
  subnet_prefixes     = [var.dmz, var.public1, var.public2, var.private1, var.private2]
  subnet_names        = ["dmz", "public1", "public2", "private1", "private2"]
  tags                = merge({ Name = "first resource group" }, local.common_tags)
}

# route table
//resource "azurerm_route_table" "vn1_fw_subnet" {
//  name                = var.route_table_name
//  location            = var.location
//  resource_group_name = azurerm_resource_group.first_rg.name
//
//  tags = merge({
//    Name = "vn1_route_table_fw_subnet" },
//  local.common_tags)
//}
//
//resource "azurerm_subnet_route_table_association" "vn1_rt_assoc" {
//  route_table_id = azurerm_route_table.vn1_fw_subnet.id
//  subnet_id = azurerm_subnet.fw_subnet.id
//}

