output "public_nat_ip" {
  value = "${module.routes.ngw_public_ip}"
}

output "public_subnet_ids" {
  value = "${module.subnets.public_ids}"
}

output "private_subnet_ids" {
  value = "${module.subnets.private_ids}"
}

output "vpc_id" {
  value = "${module.vpc.id}"
}
