# Banking Demo Infra Bootstrap

Phần này chứa Terraform và Ansible để bootstrap môi trường VPS cho Banking Demo.

## Luồng chạy
1. Sửa `infra/terraform/environments/vps-dev/terraform.tfvars`
2. Chạy Terraform:
   - `cd infra/terraform/environments/vps-dev`
   - `terraform init`
   - `terraform plan`
   - `terraform apply`
3. Terraform sẽ ghi trực tiếp:
   - `infra/ansible/inventories/vps/hosts.ini`
   - `infra/ansible/inventories/vps/group_vars/all.yml`
4. Chạy Ansible:
   - `cd infra/ansible`
   - `ansible-playbook playbooks/site.yml`

## Điều kiện
Repository GitHub phải chứa sẵn:
- `phase2-helm-chart/argocd/project-phase4.yaml`
- `phase2-helm-chart/argocd/application-phase4.yaml`
- các file trong `phase3-monitoring-keda/`
