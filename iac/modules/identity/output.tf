output "aks_identity_id" {
  value = azurerm_user_assigned_identity.aks_identity.id
}

output "aks_identity_client_id" {
  value = azurerm_user_assigned_identity.aks_identity.client_id
}