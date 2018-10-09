# Droplet Resources

locals {
  tags = ["createdby:terraform"]
}

resource "digitalocean_droplet" "main" {
  count     = "${length(var.droplet_names)}"
  ssh_keys  = ["${digitalocean_ssh_key.main.fingerprint}"]
  image     = "${var.droplet_image}"
  region    = "${element(var.do_regions, count.index)}"
  size      = "${var.droplet_size}"
  name      = "${element(var.droplet_names, count.index)}"
  backups   = "${var.droplet_backups}"
  user_data = "${var.user_data}"
  tags      = "${concat(local.tags, var.tags_shared)}"
}

resource "digitalocean_floating_ip" "main" {
  count      = "${var.floating_ip ? length(var.droplet_names) : 0}"
  droplet_id = "${element(digitalocean_droplet.main.*.id, count.index)}"
  region     = "${element(digitalocean_droplet.main.*.region, count.index)}"
}

resource "digitalocean_ssh_key" "main" {
  name       = "${var.key_name}"
  public_key = "${file(var.key_path)}"
}
