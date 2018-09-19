output "public_subnet_ids" {
  value = "${module.subnets.public_ids}"
}

output "private_subnet_ids" {
  value = "${module.subnets.private_ids}"
}
