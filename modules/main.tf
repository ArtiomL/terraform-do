# DigitalOcean Resources

provider "digitalocean" {}

# Droplet
module "droplet" {
  source        = "./droplet"
  do_region     = "${var.do_region}"
  key_path      = "${var.key_path}"
  key_name      = "${var.key_name}"
  droplet_names = "${var.droplet_names}"
  droplet_image = "${var.droplet_image}"
  droplet_size  = "${var.droplet_size}"
  user_data     = "${var.user_data}"
  tags_shared   = "${var.tags_shared}"
}
