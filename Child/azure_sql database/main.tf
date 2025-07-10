resource "azurerm_mssql_database" "database" {
  name         = var.sqldatabse_name
  server_id    = data.azurerm_mssql_server.serv.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
}

data "azurerm_mssql_server" "serv" {
  name                = var.sqlserver_name
  resource_group_name = var.rg_name
}

