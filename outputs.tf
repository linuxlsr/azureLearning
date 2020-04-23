output "key_vault_name" {
  value = azurerm_key_vault.key_vault.name
}

//output "first_action_group" {
//  value = azurerm_monitor_action_group.first_action_group.name
//}

output "vpc_name" {
  value = azurerm_virtual_network.virtual_network_1.name
}

output "rg" {
  value = azurerm_resource_group.first_rg.name
}

output "state_rg" {
  value = azurerm_resource_group.tfstate.name
}
//
//output "sec_group" {
//  value = azurerm_network_security_group.test_vm_sg.name
//}
//
//output "vm_name" {
//  value = azurerm_linux_virtual_machine.testing.name
//}
//
//output "vm_public_ip" {
//  value = azurerm_public_ip.test_ip.ip_address
//}
//
//output "oms_workspace_name" {
//  value = azurerm_log_analytics_workspace.first_oms_workspace.name
//}

output "share_url" {
  value = azurerm_storage_share.gsa_share.url
}