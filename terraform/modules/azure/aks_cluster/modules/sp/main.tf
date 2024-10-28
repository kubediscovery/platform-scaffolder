data "azuread_client_config" "current" {}


resource "azuread_application" "this" {
  display_name = "external-secrets-app"
  owners       = data.azuread_client_config.current.object_id

}

resource "azuread_service_principal" "this" {
  client_id                    = azuread_application.this.client_id
  owners                       = data.azuread_client_config.current.object_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.id
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "this" {
  name = "synera-d-akv-00001"
  resource_group_name = "shared"
}

resource "azurerm_key_vault_access_policy" "this" {
  key_vault_id = data.azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_service_principal.this.object_id

  secret_permissions = [
    "Get",
    "List",
  ]
}