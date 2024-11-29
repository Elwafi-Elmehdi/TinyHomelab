data "netlify_dns_zone" "mehdij4_zone" {
  name = "mehdij4.com"
}

resource "netlify_dns_record" "vault_record" {
  type     = "A"
  zone_id  = data.netlify_dns_zone.mehdij4_zone.id
  hostname = "vault.mehdij4.com"
  value    = "192.168.1.70"
}

resource "netlify_dns_record" "proxmox1_record" {
  type     = "A"
  zone_id  = data.netlify_dns_zone.mehdij4_zone.id
  hostname = "pve1.mehdij4.com"
  value    = "192.168.1.1"
}

resource "netlify_dns_record" "monitoring_record" {
  type     = "A"
  zone_id  = data.netlify_dns_zone.mehdij4_zone.id
  hostname = "monitoring.mehdij4.com"
  value    = "192.168.1.10"
}

resource "netlify_dns_record" "tower_record" {
  type     = "A"
  zone_id  = data.netlify_dns_zone.mehdij4_zone.id
  hostname = "tower.mehdij4.com"
  value    = "192.168.1.20"
}
