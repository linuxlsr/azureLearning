#sg and rules

module "network-security-group" {
  source                = "Azure/network-security-group/azurerm"
  version               = "3.0.1"
  security_group_name   = "default_set"
  resource_group_name   = azurerm_resource_group.first_rg.name
  source_address_prefix = [data.external.myipaddr.result.ip]
  custom_rules = [
    {
      name                   = "modSGhttp"
      priority               = "200"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      destination_port_range = "80"
      description            = "mod-sg-http-rule"
      source_address_prefix  = data.external.myipaddr.result.ip
    },
    {
      name                   = "modSGssh"
      priority               = "100"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      destination_port_range = "22"
      description            = "mod-sg-http-rule"
      source_address_prefix  = data.external.myipaddr.result.ip
    }
  ]
  tags = merge({ Name = "first security group" }, local.common_tags)
}

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
    source_address_prefix      = data.external.myipaddr.result.ip
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "http80"
    access                     = "Allow"
    direction                  = "Inbound"
    priority                   = 1005
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = data.external.myipaddr.result.ip
    destination_address_prefix = "VirtualNetwork"
  }

  //  security_rule {
  //    name                       = "http8080"
  //    access                     = "Allow"
  //    direction                  = "Inbound"
  //    priority                   = 1010
  //    protocol                   = "Tcp"
  //    source_port_range          = "*"
  //    destination_port_range     = "8080"
  //    source_address_prefix      = "0.0.0.0/0"
  //    destination_address_prefix = "VirtualNetwork"
  //  }

  tags = merge({ Name = "first security group" }, local.common_tags)
}

resource "azurerm_subnet_network_security_group_association" "sg-assoc-sn0" {
  network_security_group_id = azurerm_network_security_group.test_vm_sg.id
  subnet_id                 = module.network.vnet_subnets[0]
}

resource "azurerm_subnet_network_security_group_association" "sg-assoc-sn1" {
  network_security_group_id = azurerm_network_security_group.test_vm_sg.id
  subnet_id                 = module.network.vnet_subnets[1]
}

//resource "azurerm_network_interface_security_group_association" "sg-assoc-vm-nic" {
//  network_security_group_id = azurerm_network_security_group.test_vm_sg.id
//  network_interface_id = module.linux_vm.network_interface_ids[0]
//}