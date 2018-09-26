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
  count = "${var.peer_vpc_id == "" ? 0 : 1}"

  auto_accept = true
  peer_vpc_id = "${var.peer_vpc_id}"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${var.tag_name}"
  }
}
