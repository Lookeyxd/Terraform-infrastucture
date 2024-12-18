resource "azurerm_resource_group" "main" {
  name                      = var.resource_group_name
  location                  = var.location
}

resource "time_sleep" "wait_for_rg" {
  depends_on                = [azurerm_resource_group.main]
  create_duration           = "10s"  # Adjust duration as needed
}

module "Network" {
  source                    = "./modules/Network"
  vnet_name                 = "myVNet"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  address_space             = var.address_space
  address_prefix            = var.address_prefix
  subnet_name               = var.subnet_name
  depends_on                = [time_sleep.wait_for_rg]
}

module "db_install" {
  source              = "./modules/db-install"
  location            = var.location
  resource_group_name = var.resource_group_name
  blob_name           = var.blob_name
  depends_on          = [time_sleep.wait_for_rg]
}

module "Webserver" {
  source = "./modules/vm"
  Webserver_name           = var.Webserver_name
  vm_name                  = var.Webserver_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  blob_name                = var.blob_name
  admin_username           = var.admin_username
  admin_password           = var.admin_password
  assign_public_ip         = true  # Kun web_vm får offentlig IP
  subnet_id                = module.Network.subnet_id
  nsg_id                   = module.Network.web_nsg_id
  storage_account_name     = module.db_install.storage_account_name
  storage_account_key      = module.db_install.storage_account_key
  install_script_url       = "https://${var.blob_name}.blob.core.windows.net/play/playbook.yml"
  depends_on               = [module.db_install, time_sleep.wait_for_rg]
}

output "debug_storage_account_name" {
  value = module.db_install.storage_account_name
}

output "installurl" {
  value = module.db_install.storage_account_name
}

module "Database" {
  source                   = "./modules/vm"
  count                    = 2
  Webserver_name           = var.Webserver_name
  Database_name            = var.Database_name
  vm_name                  = "${var.Database_name}-${count.index}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  blob_name                = var.blob_name
  admin_username           = var.admin_username
  admin_password           = var.admin_password
  subnet_id                = module.Network.subnet_id
  assign_public_ip         = false # Ingen offentlig IP for db_vm
  backend_pool_id          = module.loadbalancer.backend_pool_id
  storage_account_name     = module.db_install.storage_account_name
  storage_account_key      = module.db_install.storage_account_key
  install_script_url       = "https://${var.blob_name}.blob.core.windows.net/install/install_mariadb.sh"
  depends_on               = [module.db_install, time_sleep.wait_for_rg]
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.Network.subnet_id
  depends_on          = [time_sleep.wait_for_rg]
}
