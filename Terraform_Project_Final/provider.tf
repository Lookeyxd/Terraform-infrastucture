data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
   subscription_id        = var.sub
}
terraform {
  required_providers {
    azurerm               = {
      source              = "hashicorp/azurerm"
      version             = "~> 2.0"
    }
    time = {
      source              = "hashicorp/time"
      version             = "~> 0.7"
    }
  }
}
