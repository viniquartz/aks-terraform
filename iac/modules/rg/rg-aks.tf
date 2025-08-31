resource "azurerm_resource_group" "rg-lab001-aks" {
  name     = "${var.resource_group_name}-aks"
  location = var.location
  tags = var.tags
}