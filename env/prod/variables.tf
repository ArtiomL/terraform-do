# Input Variables

variable "do_regions" {
  description = "DigitalOcean regions"
  type        = "list"
  default     = ["fra1", "nyc1"]
}

# --- Droplet --- #

variable "key_path" {
  description = "SSH public key path"
  default     = "/home/user/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "Seashell"
}

variable "droplet_names" {
  description = "Droplet names"
  type        = "list"
  default     = ["Droplet", "Sandbox"]
}

variable "droplet_image" {
  description = "Droplet image ID or slug"
  default     = "coreos-stable"
}

variable "droplet_size" {
  description = "Droplet size slug"
  default     = "s-1vcpu-1gb"
}

variable "droplet_backups" {
  description = "Enable Droplet backups"
  default     = true
}

variable "floating_ip" {
  description = "Assign Floating IP"
  default     = false
}

variable "droplet_user" {
  description = "Droplet user"
  default     = "nemo"
}

variable "ssh_port" {
  description = "Droplet SSH port"
  default     = 22
}

variable "user_data_path" {
  description = "Cloud-config user data path"
  default     = "init.tpl"
}

# --- Firewall --- #

variable "firewall_name" {
  description = "Firewall name"
  default     = "Dam"
}

variable "mgmt_asrc" {
  description = "Source IPv4 CIDR block(s) allowed to access management"
  default     = []
}

# --- Slack --- #

variable "webhook_url" {
  description = "Incoming Webhook URL"
  default     = "T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
}

# --- Tags --- #

variable "tags_shared" {
  description = "Tags assigned to all resources"
  default     = ["env:prod", "owner:artioml", "project:nautilus"]
}
