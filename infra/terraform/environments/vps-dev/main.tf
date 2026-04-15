module "vps_contract" {
  source = "../../modules/vps_contract"

  environment               = var.environment
  server_name               = var.server_name
  public_ip                 = var.public_ip
  ssh_user                  = var.ssh_user
  ssh_port                  = var.ssh_port
  ssh_private_key_path      = var.ssh_private_key_path
  domain_name               = var.domain_name
  enable_argocd             = var.enable_argocd
  enable_monitoring         = var.enable_monitoring
  enable_phase4_bootstrap   = var.enable_phase4_bootstrap
  k3s_version               = var.k3s_version
  kubeconfig_path           = var.kubeconfig_path
  repo_url                  = var.repo_url
  repo_branch               = var.repo_branch
  repo_path_on_server       = var.repo_path_on_server
  argocd_app_name           = var.argocd_app_name
  helm_chart_path           = var.helm_chart_path
  output_dir                = "${path.root}/../../../ansible/inventories/vps"
}
