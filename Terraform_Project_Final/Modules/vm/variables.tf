variable "vm_name" {
  type        = string
  description = "Name of the vm"
}

variable "vm_size" {
  description = "Størrelse på virtuell maskin"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "image_publisher" {
  description = "Bildeleverandør for VM"
  type        = string
  default     = "Debian"
}

variable "image_offer" {
  description = "Image offer for VM"
  type        = string
  default     = "debian-12"
}

variable "image_sku" {
  description = "Image SKU for VM"
  type        = string
  default     = "12"
}

variable "image_version" {
  description = "Bildeversjon for VM"
  type        = string
  default     = "latest"
}

variable "resource_group_name" {
  type        = string
  description = "Navnet på ressursgruppen som skal brukes"
}

variable "location" {
  type        = string
  description = "Lokasjon for ressursene"
}

variable "admin_username" {
  type        = string
  description = "Admin"
}

variable "admin_password" {
  type        = string
  description = "Passord for admin bruker"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account for scripts"
  default     = "mariadbinstalltest"
}

variable "storage_account_key" {
  type        = string
  description = "Storage account key for script access"
  sensitive   = true

}

variable "subnet_id" {
  type        = string
}

variable "install_script_url" {
  description = "URL to the MariaDB installation script"
  type        = string
  default     = "mariadbinstalltest"
}

variable "assign_public_ip" {
  type        = bool
  description = "Angi om VM-en skal ha en offentlig IP-adresse"
  default     = false
}

variable "backend_pool_id" {
  type        = string
  description = "ID of the load balancer backend pool"
  default     = null
}

variable "nsg_id" {
  type        = string
  description = "ID of the network security group"
  default     = null
}

variable "blob_name" {
  type        = string
  description = "Størrelsen på database-VM-ene"
  default     = "blobblobblobblobblob"
}

variable "Webserver_name" {
  type        = string
  description = "Name of the webserver"
  default     = "Webserver"
}
#Database
variable "Database_name" {
  type        = string
  description = "Name of the databaseserveren"
  default     = "Database"
}