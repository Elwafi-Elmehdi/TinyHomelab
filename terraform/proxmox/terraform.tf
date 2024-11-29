terraform {
  required_version = "1.7.1"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }
  }
  backend "s3" {
    profile        = "personnel-aws"
    bucket         = "mehdij4-tinyhomelab-terraform-statefile"
    key            = "homelab/proxmox/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
  }
}
