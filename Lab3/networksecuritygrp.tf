# Create a vnet
resource "azurerm_virtual_network" "example" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = var.resourcegrpName
  address_space       = ["10.0.0.0/24"]
  tags  = var.tags
}

resource "azurerm_subnet" "mySubnet1" {
  name                 = "mySubnet1"
  resource_group_name  = var.resourcegrpName
  virtual_network_name = var.vnetName
  address_prefixes     = ["10.0.0.0/25"]
}

resource "azurerm_subnet" "mySubnet2" {
  name                 = "mySubnet2"
  resource_group_name  = var.resourcegrpName
  virtual_network_name = var.vnetName
  address_prefixes     = ["10.0.0.128/25"]
}


resource "azurerm_network_security_group" "myNetworkSecurityGroup" {
  name                = "myNetworkSecurityGroup"
  location            = var.location
  resource_group_name = var.resourcegrpName

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}


resource "azurerm_subnet_network_security_group_association" "example1" {
  subnet_id                 = azurerm_subnet.mySubnet1.id
  network_security_group_id = azurerm_network_security_group.myNetworkSecurityGroup.id
}

resource "azurerm_subnet_network_security_group_association" "example2" {
  subnet_id                 = azurerm_subnet.mySubnet2.id
  network_security_group_id = azurerm_network_security_group.myNetworkSecurityGroup.id
}
