output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "peering_connection_id" {
  value = "${local.peering_enabled ? aws_route.peer.vpc_peering_connection_id : ""}"
}
