//resource "azurerm_monitor_action_group" "first_action_group" {
//  name                = "first_action_group"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  short_name          = "1ag"
//  enabled             = var.action_group_active
//}
//
////resource "azurerm_monitor_metric_alert" "first_metric_alert" {
////  name = "first_metric_alert"
////  resource_group_name = azurerm_resource_group.first_rg.name
////  scopes = []
////  criteria {
////    aggregation = ""
////    metric_name = ""
////    metric_namespace = ""
////    operator = ""
////    threshold = 0
////  }
////  action {
////    action_group_id = azurerm_monitor_action_group.first_action_group.id
////  }
////}
//
//resource "azurerm_log_analytics_workspace" "first_oms_workspace" {
//  location            = var.location
//  name                = "linuxlsromsworkspace"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  sku                 = "Standard"
//  retention_in_days   = 30
//}
//
//resource "azurerm_monitor_action_group" "first_mon_action_group" {
//  name                = "f_mag"
//  resource_group_name = azurerm_resource_group.tfstate.name
//  short_name          = "f_mag"
//}
//
////resource "azurerm_monitor_scheduled_query_rules_log" "first_query_rule" {
////  location            = var.location
////  name                = "first_query_rule"
////  resource_group_name = azurerm_resource_group.first_rg.name
////
////  criteria {
////    metric_name = "Average+% Idle Time"
////    dimensions {
////      name     = "Computer"
////      operator = "Include"
////      values   = [azurerm_linux_virtual_machine.testing.name]
////    }
////  }
////
////  data_source_id = azurerm_log_analytics_workspace.first_oms_workspace.id
////  description    = "Scheduled query rule LogToMetric example"
////  enabled        = true
////}
//
//resource "azurerm_monitor_metric_alert" "vm_metric_alert" {
//  name                = "${azurerm_linux_virtual_machine.testing.name}_metric_alert"
//  resource_group_name = azurerm_resource_group.tfstate.name
//  scopes              = [azurerm_log_analytics_workspace.first_oms_workspace.id]
//  criteria {
//    aggregation      = "Average"
//    metric_name      = "test_log"
//    metric_namespace = "Microsoft.OperationalInsights/workspaces"
//    operator         = "GreaterThan"
//    threshold        = 1
//  }
//
//}