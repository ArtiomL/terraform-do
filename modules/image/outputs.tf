# Image Output Variables

output "id" {
  value = "${data.external.image.result.id}"
}

output "slug" {
  value = "${data.external.image.result.slug}"
}
