output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "peering_connection_id" {
  value = "${local.peering_enabled ? aws_vpc_peering_connection.main.id : ""}"
}
