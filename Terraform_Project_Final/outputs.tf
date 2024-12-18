output "web_vm_public_ip" {
  value = module.Webserver.public_ip_address
  description = "Offentlig IP for webserveren"
}

output "db_vm_ids" {
  value = [for Database in module.Database : Database.vm_id]
  description = "ID-er for database-VM-ene"
}

output "loadbalancer_id" {
  value = module.loadbalancer.lb_id
  description = "ID-en til lastbalansereren"
}
