# create internal and external zones.
# update registry record to point to new NS servers
# add cname record to existing resource
# test if resolves. So far, successful

resource "azurerm_dns_zone" "my_public_zone" {
  name = var.dns_public_zone_name
  resource_group_name = azurerm_resource_group.first_rg.name
}

resource "azurerm_dns_zone" "my_private_zone" {
  name = var.dns_private_zone_name
  resource_group_name = azurerm_resource_group.first_rg.name
}

resource "azurerm_dns_cname_record" "my_public_cname" {
  name = "www"
  zone_name = azurerm_dns_zone.my_public_zone.name
  resource_group_name = azurerm_resource_group.first_rg.name
  ttl = 300
  record = var.public_cname_record_target
}

output "cname_fqdn" {
  value = azurerm_dns_cname_record.my_public_cname.fqdn
}

output "public_zone_name_servers" {
  value = azurerm_dns_zone.my_public_zone.name_servers
}