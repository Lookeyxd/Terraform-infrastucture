#Global variables
variable "location" {
  type        = string
  description = "Azure-regionen"
}

variable "resource_group_name" {
  type        = string
  description = "Navnet på ressursgruppen"
}

variable "address_space" {
  type        = list(string)
  description = "Adresseområde for det virtuelle nettverket"
}

variable "address_prefix" {
  type        = list(string)

}

variable "subnet_name" {
  type        = string
}