resource "azurerm_network_interface" "nicn" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.rg_name

  ip_configuration {
    public_ip_address_id          = data.azurerm_public_ip.publicip.id
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnete.id
    private_ip_address_allocation =  "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machin" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.vm_location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.kvusrname.value
  admin_password      = data.azurerm_key_vault_secret.kvusrpass.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nicn.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  custom_data = base64encode(<<-EOF
  #!/bin/bash
  apt-get update
  apt-get install -y nginx
  systemctl enable nginx
  systemctl start nginx
EOF
)



}