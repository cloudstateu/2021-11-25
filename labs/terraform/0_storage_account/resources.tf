

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-${var.rg_name}"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "CHANGEME"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}