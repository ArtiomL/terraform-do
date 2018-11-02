# DigitalOcean Resources

provider "digitalocean" {}

# Droplet
module "droplet" {
  source          = "./droplet"
  do_regions      = "${var.do_regions}"
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
  mgmt_asrc     = "${coalescelist(var.mgmt_asrc, module.ifconfig.list)}"
  tags_shared   = "${var.tags_shared}"
}
