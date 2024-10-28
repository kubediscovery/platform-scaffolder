data "azuread_client_config" "current" {}


data "azuread_application" "this" {
  display_name = "external-secrets-reader"
}

data "azuread_service_principal" "this" {
  client_id                    = data.azuread_application.this.client_id
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