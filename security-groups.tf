#sg and rules
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
    source_address_prefix      = "104.172.161.115/32"
    destination_address_prefix = "*"
  }

  tags = merge({
    Name = "first security group" },
  local.common_tags)
}