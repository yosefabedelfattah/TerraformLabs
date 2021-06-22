# Create a resource group
resource "azurerm_resource_group" "my_yaresourcegrp" {
  name     = "lab1_yaresourcegrp"
  location = "West Europe"
}