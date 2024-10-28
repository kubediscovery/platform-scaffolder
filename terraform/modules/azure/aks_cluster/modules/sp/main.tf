
data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "this" {
  name = "synera-d-akv-00001"
  resource_group_name = "shared"
}

resource "azurerm_key_vault_access_policy" "reader" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "9c3fd8aa-39c8-4063-a03d-94cd5efaf81e"

  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "azurerm_key_vault_access_policy" "writer" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "d78154d8-0c98-40bd-b0f4-cd3bf95bb820"

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge",
    "Restore",
  ]
}