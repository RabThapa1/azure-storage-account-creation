resource "azurerm_resource_group" "rg1" {

  name     = "rg-np-tf"
  location = "Australia east"

}


resource "azurerm_storage_account" "hdd" {

  name                     = "tffirststorageaccount"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {

    environment = "Non-Production"

  }


}


resource "azurerm_storage_container" "example" {

  name                  = "content"
  storage_account_name  = azurerm_storage_account.hdd.name
  container_access_type = "private"


}


resource "azurerm_storage_blob" "example" {

  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.hdd.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "some-local-file-zip"





}
