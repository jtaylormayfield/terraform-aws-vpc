locals {
  peering_enabled = "${lookup(var.peer_vpc, "vpc_id", "") == "" && lookup(var.peer_vpc, "route_table_id", "") == ""}"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.internal_hostnames}"
  enable_dns_support   = "${var.internal_dns}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${var.tag_name}"
  }
}

resource "aws_vpc_peering_connection" "main" {
  count = "${local.peering_enabled ? 1 : 0}"

  auto_accept = true
  peer_vpc_id = "${var.peer_vpc["vpc_id"]}"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${var.tag_name}"
  }
}

resource "aws_route" "peer" {
  count = "${local.peering_enabled ? 1 : 0}"

  destination_cidr_block    = "${aws_vpc.vpc.cidr_block}"
  route_table_id            = "${var.peer_vpc["route_table_id"]}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main.id}"
}
