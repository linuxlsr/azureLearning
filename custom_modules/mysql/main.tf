resource "azurerm_mysql_server" "test_mysql_svr" {
  location                     = var.location
  sku_name                     = var.sku_name
  administrator_login          = var.admin_username
  administrator_login_password = var.password
  version                      = var.db_version
  ssl_enforcement              = var.ssl_enforcement
  name                         = var.db_name
  resource_group_name          = var.resource_group_name

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
    auto_grow             = var.auto_grow
  }

  tags = var.tags
}