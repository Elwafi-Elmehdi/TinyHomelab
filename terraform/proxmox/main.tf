###########################
## Automation
###########################

resource "proxmox_vm_qemu" "tower" {
  target_node = "pve"
  name        = "tower.mehdij4.com"
  pool        = "automation"
  sockets     = 1
  memory      = 1024
  agent       = 1
  os_type     = "cloud-init"
  scsihw      = "virtio-scsi-pci"
  clone       = "debian-10"
  full_clone  = false
  ciuser      = "root"
  cipassword  = "0256"
  ciupgrade   = true
  sshkeys     = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQ+XFV7YEe5niRYzppt2Xx7EvmP9n7nInlnXBv49zlx Ansible SSH keys
  EOF
  ipconfig0   = "ip=192.168.1.20/24,gw=192.168.1.200"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  serial {
    id   = 0
    type = "socket"
  }

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "vols-data"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "4G"
          storage = "vols-data"
        }
      }
      scsi1 {
        disk {
          size    = "2G"
          storage = "vols-data"
        }
      }
      scsi2 {
        disk {
          size    = "2G"
          storage = "vols-data"
        }
      }
    }
  }
}

###########################
## Monitoring
###########################

resource "proxmox_vm_qemu" "monitoring" {
  target_node = "pve"
  name        = "monitoring.mehdij4.com"
  pool        = "monitoring"
  sockets     = 1
  memory      = 1024
  agent       = 1
  os_type     = "cloud-init"
  scsihw      = "virtio-scsi-pci"
  clone       = "debian-10"
  full_clone  = false
  ciuser      = "root"
  cipassword  = "0256"
  ciupgrade   = true
  sshkeys     = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQ+XFV7YEe5niRYzppt2Xx7EvmP9n7nInlnXBv49zlx Ansible SSH keys
  EOF
  ipconfig0   = "ip=192.168.1.10/24,gw=192.168.1.200"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  serial {
    id   = 0
    type = "socket"
  }

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "vols-data"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "4G"
          storage = "vols-data"
        }
      }
      scsi1 {
        disk {
          size    = "2G"
          storage = "vols-data"
        }
      }
      scsi2 {
        disk {
          size    = "2G"
          storage = "vols-data"
        }
      }
    }
  }
}
