locals {
  inventory_content = <<-EOT
[vps]
${var.server_name} ansible_host=${var.public_ip} ansible_user=${var.ssh_user} ansible_port=${var.ssh_port} ansible_ssh_private_key_file=${var.ssh_private_key_path}

[k3s_server]
${var.server_name}

[argocd]
${var.server_name}

[monitoring]
${var.server_name}
EOT

  group_vars = {
    environment             = var.environment
    server_name             = var.server_name
    public_ip               = var.public_ip
    domain_name             = var.domain_name
    enable_argocd           = var.enable_argocd
    enable_monitoring       = var.enable_monitoring
    enable_phase4_bootstrap = var.enable_phase4_bootstrap
    k3s_version             = var.k3s_version
    kubeconfig_path         = var.kubeconfig_path
    repo_url                = var.repo_url
    repo_branch             = var.repo_branch
    repo_path_on_server     = var.repo_path_on_server
    argocd_app_name         = var.argocd_app_name
    helm_chart_path         = var.helm_chart_path
    argocd_namespace        = "argocd"
    banking_namespace       = "banking"
    monitoring_namespace    = "monitoring"
    keda_namespace          = "keda"
    argocd_project_file     = "${var.repo_path_on_server}/phase2-helm-chart/argocd/project-phase4.yaml"
    argocd_application_file = "${var.repo_path_on_server}/phase2-helm-chart/argocd/application-phase4.yaml"
    ingress_host            = var.domain_name
  }
}

resource "local_file" "inventory" {
  filename = "${var.output_dir}/hosts.ini"
  content  = local.inventory_content
}

resource "local_file" "group_vars_all" {
  filename = "${var.output_dir}/group_vars/all.yml"
  content  = yamlencode(local.group_vars)
}

resource "local_file" "bootstrap_meta" {
  filename = "${var.output_dir}/bootstrap.json"
  content = jsonencode({
    environment             = var.environment
    server_name             = var.server_name
    public_ip               = var.public_ip
    ssh_user                = var.ssh_user
    ssh_port                = var.ssh_port
    enable_argocd           = var.enable_argocd
    enable_monitoring       = var.enable_monitoring
    enable_phase4_bootstrap = var.enable_phase4_bootstrap
    repo_url                = var.repo_url
    repo_branch             = var.repo_branch
    repo_path_on_server     = var.repo_path_on_server
    argocd_app_name         = var.argocd_app_name
    helm_chart_path         = var.helm_chart_path
  })
}
