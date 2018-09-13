resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.internal_hostnames}"
  enable_dns_support   = "${var.internal_dns}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${var.tag_name}"
  }
}
