# SQL SERVER
resource "azurerm_sql_server" "sqlserver" {
  name                         = "persistentsql1"
  resource_group_name          = "${azurerm_resource_group.resource_gp.name}"
  location                     = "${azurerm_resource_group.resource_gp.location}"
  version                      = "12.0"
  administrator_login          = "sqladministrator"
  administrator_login_password = "P@ssw0rd_123"
}

# DB Virutal Network Rule
resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                = "sql-vnet-rule"
  resource_group_name = "${azurerm_resource_group.resource_gp.name}"
  server_name         = "${azurerm_sql_server.sqlserver.name}"
  subnet_id           = "${azurerm_subnet.dbsubnet.id}"
}

# DB Sub Net
resource "azurerm_subnet" "dbsubnet" {
  name                 = "dbsubnet"
  resource_group_name  = "${azurerm_resource_group.resource_gp.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.7.29.0/29"
  service_endpoints    = ["Microsoft.Sql"]
}