# Droplet Resources

locals {
  tags = ["createdby:terraform"]
}

resource "digitalocean_droplet" "main" {
  count    = "${length(var.droplet_names)}"
  ssh_keys = "${var.ssh_keys}"
  image    = "${var.droplet_image}"
  region   = "${var.do_region}"
  size     = "${var.droplet_size}"
  name     = "${element(var.droplet_names, count.index)}"
  tags     = "${concat(local.tags, var.tags_shared)}"
}

resource "digitalocean_floating_ip" "main" {
  droplet_id = "${element(digitalocean_droplet.main.*.id, count.index)}"
  region     = "${var.do_region}"
}
