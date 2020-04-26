# MySQL database resources
# two public mysql mods broken by Blocks of type "sku" are not expected here.


//resource "azurerm_mysql_database" "test_mysql_db" {
//  charset             = "utf8"
//  collation           = "utf8_unicode_ci"
//  name                = "test-mysql-db"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  server_name         = azurerm_mysql_server.test_mysql_svr.name
//}
//
//# Azure SQL db resources
//resource "azurerm_sql_server" "test_sql_server" {
//  administrator_login          = var.admin_username
//  administrator_login_password = "f9pfmh$zBylw(f." # need to integrate secrets management
//  location                     = var.location
//  name                         = "linuxlsrsqlsvr"
//  resource_group_name          = azurerm_resource_group.first_rg.name
//  version                      = "12.0"
//  tags = merge({
//    Name = "test sql server" },
//  local.common_tags)
//}
//
//resource "azurerm_sql_database" "test_sql_database" {
//  location            = var.location
//  name                = "test-sql-db"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  server_name         = azurerm_sql_server.test_sql_server.name
//  tags = merge({
//    Name = "test sql database" },
//  local.common_tags)
//
//// this fails validation as unexpected block, but is in docs.
////  extended_auditing_policy {
////    storage_endpoint                        = azurerm_storage_account.general_storage_account.primary_blob_endpoint
////    storage_account_access_key              = azurerm_storage_account.general_storage_account.primary_access_key
////    storage_account_access_key_is_secondary = true
////    retention_in_days                       = 6
////  }
//}

# this works :-)
module "mysql" {
  source                = "./custom_modules/mysql"
  admin_username        = var.admin_username
  db_name               = "test-mysql-db"
  location              = var.location
  password              = var.db_password
  backup_retention_days = 7
  charset               = "utf8"
  collation             = "utf8_unicode_ci"
  db_version            = "5.7"
  resource_group_name   = azurerm_resource_group.first_rg.name
  sku_capacity          = 2
  sku_family            = "Gen5"
  sku_name              = "B_Gen5_2"
  sku_tier              = "Basic"
  ssl_enforcement       = "Enabled"
  storage_mb            = 5120
  auto_grow             = "Disabled"
  tags                  = merge({ Name = "first_fw_rule" }, local.common_tags)
  geo_redundant_backup  = "Disabled"
}