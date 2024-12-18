#General
variable "resource_group_name" {
  type                = string
  description         = "Navnet på ressursgruppen som skal brukes"
}

variable "location" {
  type                = string
  description         = "Lokasjon for ressursene"
}

variable "admin_username" {
  type                = string
}

variable "admin_password" {
  type                = string
}

#Network
variable "address_space" {
  type                = list(string)
}

variable "subnet_name" {
  type                = string
}

variable "address_prefix" {
  type                = list(string)

}

variable "vnet_name" {
  type                = string
  description         = "Navnet på det virtuelle nettverket"
}

variable "sub" {
  type                = string
  description         = "Subscription_ID"
}

variable "blob_name" {
  type        = string
  description = "Størrelsen på database-VM-ene"
  default     = "blobblobblobblobblob"
}

#Webserver
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

#loadbalancer
variable "loadbalancer_name" {
  default = "db-loadbalance"
}