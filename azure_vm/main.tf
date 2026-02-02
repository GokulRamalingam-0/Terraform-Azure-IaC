resource "azurerm_virtual_network" "vnet" {
  name                = "vm-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.vm_details.location
  resource_group_name = var.vm_details.rg_name
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = var.vm_details.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "vm-pip"
  location            = var.vm_details.location
  resource_group_name = var.vm_details.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = var.vm_details.location
  resource_group_name = var.vm_details.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_details.vm_name
  resource_group_name = var.vm_details.rg_name
  location            = var.vm_details.location
  size                = var.vm_details.vm_size
  admin_username      = var.vm_details.admin_username
  admin_password      = var.vm_details.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = var.vm_details.location
  resource_group_name = var.vm_details.rg_name
}

resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = "AllowSSHAccess"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.vm_details.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_interface_security_group_association" "attach" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
