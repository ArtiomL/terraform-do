# DigitalOcean Resources

provider "digitalocean" {}

# Droplet
module "droplet" {
  source          = "./droplet"
  do_region       = "${var.do_region}"
  key_path        = "${var.key_path}"
  key_name        = "${var.key_name}"
  droplet_names   = "${var.droplet_names}"
  droplet_image   = "${var.droplet_image}"
  droplet_size    = "${var.droplet_size}"
  droplet_backups = "${var.droplet_backups}"
  floating_ip     = "${var.floating_ip}"
  user_data       = "${var.user_data}"
  tags_shared     = "${var.tags_shared}"
}

# Public IP
module "ifconfig" {
  source = "github.com/ArtiomL/f5-terraform/modules/common/ifconfig"
}

# Firewall
module "firewall" {
  source        = "./firewall"
  firewall_name = "${var.firewall_name}"
  droplet_ids   = "${module.droplet.ids}"
  tags_shared   = "${var.tags_shared}"
}
