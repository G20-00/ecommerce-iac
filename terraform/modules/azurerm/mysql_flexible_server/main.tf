resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "ecommerce-autoiac-mysqlserver"
  resource_group_name    = var.rg_name
  location               = var.rg_location
  version                = "5.7"
  administrator_login    = "mysqladmin"
  administrator_password = "H@Sh1CoR3!"
  tags                   = var.mysql_tags
  sku_name               = "GP_Standard_D2ds_v4"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  high_availability {
    mode = "ZoneRedundant"
  }

  lifecycle {
    ignore_changes = [
      high_availability
    ]
  }
}
