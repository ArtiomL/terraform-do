# Droplet Output Variables

output "ids" {
  value = ["${digitalocean_droplet.main.*.id}"]
}
