# networking
output "vnet_name" { value = module.network.vnet_name }

output "vnet_subnets" { value = module.network.vnet_subnets }

output "key_vault_name" { value = azurerm_key_vault.key_vault.name }
//
////output "first_action_group" {
////  value = azurerm_monitor_action_group.first_action_group.name
////}
//
//output "vpc_name" {
//  value = azurerm_virtual_network.virtual_network_1.name
//}
//
output "rg" { value = azurerm_resource_group.first_rg.name }
//
output "state_rg" { value = azurerm_resource_group.tfstate.name }

////output "oms_workspace_name" {
////  value = azurerm_log_analytics_workspace.first_oms_workspace.name
////}
//
//output "share_url" {
//  value = azurerm_storage_share.gsa_share.url
//}
//
////output "mysql_endpoint" {
////  value = azurerm_mysql_server.test_mysql_svr.fqdn
////}
////
////output "mssql_endpoint" {
////  value = azurerm_sql_server.test_sql_server.fully_qualified_domain_name
////}