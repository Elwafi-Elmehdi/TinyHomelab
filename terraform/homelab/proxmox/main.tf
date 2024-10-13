resource "proxmox_vm_qemu" "prometheus" {
  full_clone  = false
  target_node = "pve"
  name        = "prometheus-grafana"
  agent       = 1
  onboot      = true

  # Resources
  cpu     = "host"
  scsihw  = "virtio-scsi-single"
  sockets = 1
  memory  = 1024

  network {
    bridge   = "vmbr0"
    firewall = true
    model    = "virtio"
  }
  disks {
    scsi {
      scsi0 {
        disk {
          size    = "8G"
          storage = "vols-data"
        }
      }
      scsi1 {
        disk {
          size    = "2G"
          storage = "vols-data"
        }
      }
    }
  }
}