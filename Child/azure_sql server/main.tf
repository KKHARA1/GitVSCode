resource "azurerm_mssql_server" "server" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.sqlserver_location
  version                      = "12.0"
  administrator_login          = var.sqlserver_administrator_login
  administrator_login_password = var.sqlserver_administrator_login_password
  
}