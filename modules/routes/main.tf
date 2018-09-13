locals {
  tag_prefix_name = "${var.tag_name}-routes"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}"
  }
}

resource "aws_eip" "ngw_eip" {
  count      = "${var.num_private_subnets > 0 ? "1" : "0"}"
  depends_on = ["aws_internet_gateway.igw"]
  vpc        = true

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}"
  }
}

resource "aws_nat_gateway" "ngw" {
  count         = "${var.num_private_subnets > 0 ? "1" : "0"}"
  allocation_id = "${aws_eip.ngw_eip.*.id[0]}"
  subnet_id     = "${var.public_subnet_ids[0]}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}-private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}-public"
  }
}

resource "aws_route" "private_nat_route" {
  count                  = "${var.num_private_subnets > 0 ? "1" : "0"}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.ngw.*.id[0]}"
  route_table_id         = "${aws_route_table.private.id}"
}

resource "aws_route" "public_route" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
  route_table_id         = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count          = "${var.num_private_subnets}"
  subnet_id      = "${var.private_subnet_ids[count.index]}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "public" {
  count          = "${var.num_public_subnets}"
  subnet_id      = "${var.public_subnet_ids[count.index]}"
  route_table_id = "${aws_route_table.public.id}"
}
