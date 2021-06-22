# Create a vnet
resource "azurerm_virtual_network" "example" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = var.name
  address_space       = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "mySubnet1" {
  name                 = "mySubnet1"
  resource_group_name  = var.name
  virtual_network_name = var.vnetName
  address_prefixes     = ["10.0.0.0/25"]
}

resource "azurerm_subnet" "mySubnet2" {
  name                 = "mySubnet2"
  resource_group_name  = var.name
  virtual_network_name = var.vnetName
  address_prefixes     = ["10.0.0.128/25"]
}