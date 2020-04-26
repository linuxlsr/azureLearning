#sg and rules

//module "network-security-group" {
//  source                = "Azure/network-security-group/azurerm"
//  version               = "3.0.1"
//  security_group_name   = "default_set"
//  resource_group_name   = azurerm_resource_group.first_rg.name
//  source_address_prefix = [var.local_ip]
//  custom_rules          = []
//  tags                  = merge({ Name = "first security group" }, local.common_tags)
//}

resource "azurerm_network_security_group" "test_vm_sg" {
  location            = var.location
  name                = "${var.application}_${var.environment}_test_sg"
  resource_group_name = azurerm_resource_group.first_rg.name

  security_rule {
    name                       = "ssh"
    access                     = "Allow"
    direction                  = "Inbound"
    priority                   = 1001
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.local_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http80"
    access                     = "Allow"
    direction                  = "Inbound"
    priority                   = 1005
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http8080"
    access                     = "Allow"
    direction                  = "Inbound"
    priority                   = 1010
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }

  tags = merge({ Name = "first security group" }, local.common_tags)
}