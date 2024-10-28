data "azuread_client_config" "current" {}


data "azuread_service_principal" "this" {
  client_id                    = "98227fc0-54bd-48aa-a306-d76d5e0b263c"
}


data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "this" {
  name = "synera-d-akv-00001"
  resource_group_name = "shared"
}

resource "azurerm_key_vault_access_policy" "this" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_service_principal.this.object_id

  secret_permissions = [
    "Get",
    "List",
  ]
}