#VPC & subnets

# works but doesn't give map of subnets
//module "network" {
//  source              = "Azure/network/azurerm"
//  version             = "3.0.1"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  vnet_name           = "mynet"
//  address_space       = var.vpc_cidr
//  subnet_prefixes     = [var.firewall_subnet, var.public1, var.private2, var.private3, var.private4]
//  subnet_names        = ["firewall_subnet", "public1", "private2", "private3", "private4"]
//  tags                = merge({ Name = "first resource group" }, local.common_tags)
//}

//# route table
////resource "azurerm_route_table" "vn1_fw_subnet" {
////  name                = var.route_table_name
////  location            = var.location
////  resource_group_name = azurerm_resource_group.first_rg.name
////
////  tags = merge({
////    Name = "vn1_route_table_fw_subnet" },
////  local.common_tags)
////}
////
////resource "azurerm_subnet_route_table_association" "vn1_rt_assoc" {
////  route_table_id = azurerm_route_table.vn1_fw_subnet.id
////  subnet_id = azurerm_subnet.fw_subnet.id
////}
//
