resource "azurerm_resource_group" "rgn" {
  name     = var.rg_name
  location = var.rg_location
}