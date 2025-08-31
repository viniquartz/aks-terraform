resource "azurerm_virtual_network" "vnet-spoke-aks" {
  name                = "${var.name_project}-vnet-spoke-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]
  tags = var.tags
}