output "web_app_name" {
  value     = azurerm_windows_web_app.qcwebapp.name
  sensitive = true
}

output "web_app_url" {
  value = azurerm_windows_web_app.qcwebapp.default_hostname
}