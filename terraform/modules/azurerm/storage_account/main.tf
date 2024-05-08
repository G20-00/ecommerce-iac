resource "azurerm_storage_account" "sa" {
 name                     = "mysonarqubestorage"
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  blob_properties {
    last_access_time_enabled = true
  }

  tags = {
    Service     = "StorageService"    
    Environment = "Production"        
  }
}

resource "azurerm_storage_management_policy" "sa_policy" {
  storage_account_id = azurerm_storage_account.sa.id

  rule {
    name    = "expireOldBlobs"
    enabled = true

    filters {
      blob_types = ["blockBlob"]
    }

    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 365
      }
    }
  }
}
