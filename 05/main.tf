
resource "azurerm_resource_group" "resource_gp" {
  name     = "teraafrom-Demo1-rsg"
  location = "Central India"

  tags = {
    Owner = "Rajanikanth Nagelli"
  }
}