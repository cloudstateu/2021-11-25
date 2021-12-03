resource "azurerm_virtual_network" "aks_network" {
  name                = "${var.prefix}-${var.vnet_name}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  address_space       = [var.virtual_network_address_prefix]

  tags = var.tags
}

resource "azurerm_subnet" "kubesubnet" {
  name                 = "kubernetes"
  virtual_network_name = azurerm_virtual_network.aks_network.name
  resource_group_name  = azurerm_resource_group.aks.name
  address_prefixes = [var.aks_subnet_address_prefix]
  service_endpoints    = ["Microsoft.Sql"]
}

