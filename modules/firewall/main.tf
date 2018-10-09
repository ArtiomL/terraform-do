# Firewall Resources

locals {
  tags = ["createdby:terraform"]
}

resource "digitalocean_firewall" "main" {
  name        = "${var.firewall_name}"
  droplet_ids = ["${var.droplet_ids}"]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "1-65535"
      source_addresses = ["${var.mgmt_asrc}"]
    },
    {
      protocol         = "udp"
      port_range       = "1-65535"
      source_addresses = ["${var.mgmt_asrc}"]
    },
    {
      protocol         = "icmp"
      source_addresses = ["${var.mgmt_asrc}"]
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]

  outbound_rule = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "icmp"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]

  tags = "${concat(local.tags, var.tags_shared)}"
}
