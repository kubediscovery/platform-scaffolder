
data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "this" {
  name = "synera-d-akv-00001"
  resource_group_name = "shared"
}

resource "azurerm_key_vault_access_policy" "reader" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.service_principal_reader

  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "azurerm_key_vault_access_policy" "writer" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = local.service_principal_writer

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge",
    "Restore",
  ]
}