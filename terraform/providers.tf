terraform {
  backend "azurerm" {
    resource_group_name  = var.state_resource_group_name
    storage_account_name = var.state_storage_account_name
    container_name       = "autoecommercesc"
    key                  = "auto-terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~>2.11.0"
    }
  }
}

data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
}
