# Droplet Input Variables

variable "do_regions" {
  description = "DigitalOcean regions"
  type        = "list"
  default     = ["fra1", "nyc1"]
}

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
  default     = true
}

variable "user_data" {
  description = "Cloud-config user data acted upon by cloud-init"
  default     = "#cloud-config"
}

variable "tags_shared" {
  description = "Tags assigned to all resources"
  default     = ["env:prod", "owner:artioml", "project:nautilus"]
}
