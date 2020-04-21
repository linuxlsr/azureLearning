//resource "azurerm_policy_definition" "restrict_region" {
//  display_name = "restrict create resources to region"
//  mode         = "Indexed"
//  name         = "restrictRegion"
//  policy_type  = "Custom"
//  metadata     = <<METADATA
//    {
//      "category": "General"
//    }
//  METADATA
//
//  policy_rule = <<POLICY_RULE
//    {
//    "if": {
//      "not": {
//        "field": "location",
//        "in": "[parameters('allowedLocations')]"
//      }
//    },
//    "then": {
//      "effect": "audit"
//    }
//  }
//POLICY_RULE
//
//  parameters = <<PARAMETERS
//    {
//    "allowedLocations": {
//      "type": "Array",
//      "metadata": {
//        "description": "The list of allowed locations for resources.",
//        "displayName": "Allowed locations",
//        "strongType": "location"
//      }
//    }
//  }
//PARAMETERS
//
//}

//resource "azurerm_policy_assignment" "restrict_region_assigned_rg" {
//  name                 = "restrictToResourceGroup"
//  policy_definition_id = azurerm_policy_definition.restrict_region.id
//  scope                = azurerm_resource_group.first_rg.id
//  identity {
//    type = "SystemAssigned"
//  }
//
//  parameters = <<PARAMETERS
//  {
//    "allowedLocations": {
//      "location": ["westus"]
//    }
//  }
//  PARAMETERS
//}