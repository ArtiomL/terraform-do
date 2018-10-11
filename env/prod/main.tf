# Infrastructure

provider "digitalocean" {}

# DigitalOcean
module "do" {
  source          = "github.com/ArtiomL/terraform-do/modules"
  do_regions      = "${var.do_regions}"
  key_path        = "${var.key_path}"
  key_name        = "${var.key_name}"
  droplet_names   = "${var.droplet_names}"
  droplet_image   = "${var.droplet_image}"
  droplet_size    = "${var.droplet_size}"
  droplet_backups = "${var.droplet_backups}"
  floating_ip     = "${var.floating_ip}"
  user_data       = "${data.template_file.main.rendered}"
  firewall_name   = "${var.firewall_name}"
  mgmt_asrc       = "${var.mgmt_asrc}"
  tags_shared     = "${var.tags_shared}"
}

data "template_file" "main" {
  template = "${file(var.user_data_path)}"

  vars {
    public_key   = "${file(var.key_path)}"
    droplet_user = "${var.droplet_user}"
    ssh_port     = "${var.ssh_port}"
  }
}
