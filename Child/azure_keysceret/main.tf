variable "secret_name" {}
variable "secret_value" {}
variable "rg_name" {}
variable "keyvault_name" {}

data "azurerm_key_vault" "kvn" {
  name                = var.keyvault_name
  resource_group_name = var.rg_name
}

resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = data.azurerm_key_vault.kvn.id
}