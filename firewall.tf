resource "azurerm_firewall" "first_fw_rule" {
  location            = var.location
  name                = "firstFW"
  resource_group_name = azurerm_resource_group.first_rg.name
  ip_configuration {
    name                 = "subnet_access_rule"
    subnet_id            = azurerm_subnet.fw_subnet.id
    public_ip_address_id = azurerm_public_ip.storage_ip.id
  }
  tags = merge({
    Name = "first_fw_rule" },
  local.common_tags)
}

