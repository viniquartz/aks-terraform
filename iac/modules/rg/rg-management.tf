resource "azurerm_resource_group" "rg-lab001-management" {
  name     = "${var.resource_group_name}-management"
  location = var.location
  tags = var.tags
}