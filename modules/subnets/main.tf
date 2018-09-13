data "aws_availability_zones" "available" {}

locals {
  tag_prefix_name = "${var.tag_name}-subnets"
  zero_fmt        = "%02d"
}

resource "aws_subnet" "private" {
  count = "${var.private_subnets}"

  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"
  cidr_block        = "${cidrsubnet(var.private_cidr, max(var.private_subnets, 2), count.index)}"
  vpc_id            = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}-private-${format(local.zero_fmt, count.index + 1)}"
  }
}

resource "aws_subnet" "public" {
  count = "${var.public_subnets}"

  map_public_ip_on_launch = true
  availability_zone       = "${element(data.aws_availability_zones.available.names, count.index)}"
  cidr_block              = "${cidrsubnet(var.public_cidr, max(var.public_subnets, 2), count.index)}"
  vpc_id                  = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}-public-${format(local.zero_fmt, count.index + 1)}"
  }
}
