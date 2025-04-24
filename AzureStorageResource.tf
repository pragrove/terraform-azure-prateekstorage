resource "azurerm_storage_account" "sa1" {
  name                     = "groverstorage769"
  resource_group_name      = "TerraformRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version = "TLS1_2"
}


resource "azurerm_storage_container" "cont1" {
  name                  = "grovercontainer769"
  storage_account_name  = azurerm_storage_account.sa1.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob1" {
  name                   = "groverstorageblob769"
  storage_account_name   = azurerm_storage_account.sa1.name
  storage_container_name = azurerm_storage_container.cont1.name
  type                   = "Block"
  source                 = "Demo.zip"
}