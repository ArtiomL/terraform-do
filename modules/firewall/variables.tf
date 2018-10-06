# Firewall Input Variables

variable "firewall_name" {
  description = "Firewall name"
  default     = "Dam"
}

variable "droplet_ids" {
  description = "Droplet IDs assigned to the Firewall"
  default     = []
}

variable "mgmt_asrc" {
  description = "Source IPv4 CIDR block(s) allowed to access management"
  default     = []
}

variable "tags_shared" {
  description = "Tags assigned to all resources"
  default     = ["env:prod", "owner:artioml", "project:nautilus"]
}
