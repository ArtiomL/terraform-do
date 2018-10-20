# Image Input Variables

variable "image_dist" {
  description = "Image distribution"
  default     = "Ubuntu"
}

variable "images_url" {
  description = "Images API URL"
  default     = "https://api.digitalocean.com/v2/images?per_page=999&type=distribution"
}

variable "digitalocean_token" {
  description = "DigitalOcean personal access token"
}
