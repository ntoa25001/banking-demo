output "inventory_file" {
  value = module.vps_contract.inventory_file
}

output "group_vars_file" {
  value = module.vps_contract.group_vars_file
}

output "bootstrap_meta_file" {
  value = module.vps_contract.bootstrap_meta_file
}

output "public_ip" {
  value = module.vps_contract.public_ip
}

output "ssh_user" {
  value = module.vps_contract.ssh_user
}

output "ansible_command" {
  value = module.vps_contract.ansible_command
}
