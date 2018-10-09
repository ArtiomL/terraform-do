# DigitalOcean Output Variables

output "droplet_ips" {
  value = "${module.droplet.ips}"
}
