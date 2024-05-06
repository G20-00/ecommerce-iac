resource "azurerm_mysql_flexible_server" "example" {
  name                   = "example-mysqlserver"
  resource_group_name    = var.rg_name
  location               = var.rg_location
  version                = "5.7"
  sku_name               = "Standard_D2s_v3"
  administrator_login    = "mysqladmin"
  administrator_password = "H@Sh1CoR3!"

  delegated_subnet_id = var.snet_id

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  high_availability {
    mode = "ZoneRedundant"
  }
}
