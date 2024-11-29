resource "proxmox_pool" "monitoring" {
  poolid  = "monitoring"
  comment = "Monitoring pool for all resources for APM, Logs, and metrics"
}

resource "proxmox_pool" "automation" {
  poolid  = "automation"
  comment = "Automation pool for all resources for CI/CD, Ansible Tower..."
}
