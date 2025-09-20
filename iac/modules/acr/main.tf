resource "azurerm_container_registry" "acr" {
  name                = "${var.name_project}acr1903"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  tags = var.tags
}

resource "azurerm_role_assignment" "acr-aks" {
  principal_id                     = var.kubelet_identity
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_container_registry.acr
  ]
}