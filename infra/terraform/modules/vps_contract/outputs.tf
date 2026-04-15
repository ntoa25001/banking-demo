output "inventory_file" {
  value = local_file.inventory.filename
}

output "group_vars_file" {
  value = local_file.group_vars_all.filename
}

output "bootstrap_meta_file" {
  value = local_file.bootstrap_meta.filename
}

output "public_ip" {
  value = var.public_ip
}

output "ssh_user" {
  value = var.ssh_user
}

output "ansible_command" {
  value = "ansible-playbook -i ${local_file.inventory.filename} ../../../ansible/playbooks/site.yml"
}
