data "azurerm_public_ip" "publicip" {
  name                = var.pip_name
  resource_group_name = var.rg_name
}



data "azurerm_subnet" "subnete" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "kvusrname" {
  name         = var.secret_username
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "kvusrpass" {
  name         = var.secret_userpwd
  key_vault_id = data.azurerm_key_vault.kv.id
}
