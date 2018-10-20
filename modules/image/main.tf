# Image Data Source

data "external" "image" {
  program = ["sh", "-c", "curl -sL '${var.images_url}' -H 'Authorization: Bearer ${var.digitalocean_token}' | jq --arg image_dist ${var.image_dist} '.images[] | select(.distribution == $image_dist and (.description | startswith($image_dist)) and .public == true)' | jq -s -c 'sort_by(.description) | .[-1]' | jq '{slug: .slug}'"]
}
