# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "packerrg" {
  name     = "packerlinux02"
  location = "East US"
}

resource "azurerm_storage_account" "packersa" {
  name                     = "idjpackersa02"
  resource_group_name      = azurerm_resource_group.packerrg.name
  location                 = azurerm_resource_group.packerrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "development"
  }
}

output "packer_rg_name" {
  value = azurerm_resource_group.packerrg.name
}

output "packer_sa_name" {
  value = azurerm_storage_account.packersa.name
}