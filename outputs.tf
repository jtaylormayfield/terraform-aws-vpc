output "peering_connection_id" {
  description = "Peering connection ID. Empty if peering is disabled."
  value = "${module.vpc.peering_connection_id}"
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value = "${module.subnets.private_ids}"
}

output "public_nat_ip" {
  description = "Public NAT gateway IP."
  value = "${module.routes.ngw_public_ip}"
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value = "${module.subnets.public_ids}"
}

output "vpc_id" {
  description = "VPC ID."
  value = "${module.vpc.id}"
}
