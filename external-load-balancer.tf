# external lb test


# this module is busted, bad argument: An argument named "public_ip_address_allocation" is not expected here.
//module "loadbalancer" {
//  source              = "Azure/loadbalancer/azurerm"
//  version             = "1.2.1"
//  location            = var.location
//  lb_port             = { http = ["80", "TCP", "80"] }
//  remote_port         = { ssh = ["TCP", "22"] }
//  prefix              = "linuxlsr_lb"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  tags                = merge({ Name = "test external lb" }, local.common_tags)
//  type                = "public"
//}