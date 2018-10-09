# Droplet Output Variables

output "ids" {
  value = ["${digitalocean_droplet.main.*.id}"]
}

output "ips" {
  value = ["${digitalocean_droplet.main.*.ipv4_address}"]
}
