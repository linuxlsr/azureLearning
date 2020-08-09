//resource "azurerm_backup_policy_vm" "my-vm-bkp-policy" {
//  name                = "my-vm-backup-policy"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  recovery_vault_name = azurerm_recovery_services_vault.gsa_vault.name
//  //timezone            = "UTC" # can't find other options in docs. default is UTC, so worthless to have
//
//  backup {
//    frequency = "Daily"
//    time      = "02:00"
//  }
//
//  retention_daily {
//    count = 30
//  }
//
//}

//resource "azurerm_backup_protected_vm" "first-vm-backup-protect" {
//  backup_policy_id    = azurerm_backup_policy_vm.my-vm-bkp-policy.id
//  recovery_vault_name = azurerm_recovery_services_vault.personal_vault.name
//  resource_group_name = azurerm_resource_group.first_rg.name
//  source_vm_id        = module.linux_vm.vm_ids[0]
//}