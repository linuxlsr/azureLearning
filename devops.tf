resource "azurerm_container_registry" "first_container_registry" {
  location            = var.location
  name                = "firstContainerReg"
  resource_group_name = azurerm_resource_group.first_rg.name
  sku                 = "Standard"
  admin_enabled       = true
  #georeplication_locations
  tags                = merge({ Name = "first container registry" }, local.common_tags)
  #network_rule_set ={}

}

output "cr_admin_username" {
  value = azurerm_container_registry.first_container_registry.admin_username
}

output "cr_admin_password" {
  value = azurerm_container_registry.first_container_registry.admin_password
}