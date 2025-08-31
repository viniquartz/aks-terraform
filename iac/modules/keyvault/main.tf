data "azurerm_client_config" "current" {}
data "azurerm_subscription" "primary" {}

resource "azurerm_key_vault" "keyvault-aks" {
  name                        = "examplekeyvault"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions     = ["Get"]
    secret_permissions  = ["Get", "List", "Set", "Delete", "Purge"]
    storage_permissions = ["Get"]
  }
}

resource "azurerm_role_definition" "keyvault_admin" {
  name        = "KeyVaultAdminRole"
  scope       = var.resource_group_id
  description = "Custom role to allow creating/deleting/purging Key Vaults"

  permissions {
    actions = [
      "Microsoft.KeyVault/vaults/read",
      "Microsoft.KeyVault/vaults/write",
      "Microsoft.KeyVault/vaults/delete",
      "Microsoft.KeyVault/locations/deletedVaults/read",
      "Microsoft.KeyVault/locations/deletedVaults/purge/action"
    ]
  }

  assignable_scopes = [
    var.resource_group_id
  ]
}

resource "azurerm_role_assignment" "assign_purge" {
  scope              = var.resource_group_id
  role_definition_id = azurerm_role_definition.keyvault_admin.role_definition_resource_id
  principal_id       = data.azurerm_client_config.current.object_id
}
