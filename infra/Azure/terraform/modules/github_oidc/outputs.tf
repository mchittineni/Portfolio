output "client_id" {
  description = "Application (client) ID — set as the AZURE_CLIENT_ID GitHub secret"
  value       = azuread_application.github.client_id
}

output "application_object_id" {
  description = "Entra ID application object ID"
  value       = azuread_application.github.object_id
}

output "service_principal_object_id" {
  description = "Service principal object ID receiving the role assignments"
  value       = azuread_service_principal.github.object_id
}
