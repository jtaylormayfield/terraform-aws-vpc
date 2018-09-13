locals {
  acl_fmt = "%s_%s"

  public_inbound_acl_open   = "${contains(var.public_inbound_acls, "all")}"
  public_outbound_acl_open  = "${contains(var.public_outbound_acls, "all")}"
  private_inbound_acl_open  = "${contains(var.private_inbound_acls, "all")}"
  private_outbound_acl_open = "${contains(var.private_outbound_acls, "all")}"

  tag_prefix_name = "${var.tag_name}-security"

  tcp_rules = {
    all_from    = "0"
    all_to      = "65535"
    icmp_from   = "0"
    icmp_to     = "65535"
    http_from   = "80"
    http_to     = "80"
    https_from  = "443"
    https_to    = "443"
    ssh_from    = "22"
    ssh_to      = "22"
    eph_from    = "32768"
    eph_to      = "65535"
    nat_from    = "1024"
    nat_to      = "65535"
    mysql_from  = "3306"
    mysql_to    = "3306"
    pgsql_from  = "5432"
    pgsql_to    = "5432"
    oracle_from = "1521"
    oracle_to   = "1521"
  }
}

resource "aws_network_acl" "public" {
  subnet_ids = ["${var.public_subnet_ids}"]
  vpc_id     = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}-public"
  }
}

resource "aws_network_acl" "private" {
  subnet_ids = ["${var.private_subnet_ids}"]
  vpc_id     = "${var.vpc_id}"

  tags {
    Environment = "${var.tag_env}"
    Name        = "${local.tag_prefix_name}-private"
  }
}

resource "aws_network_acl_rule" "public_in" {
  count          = "${local.public_inbound_acl_open ? "1" : length(var.public_inbound_acls)}"
  cidr_block     = "0.0.0.0/0"
  egress         = false
  network_acl_id = "${aws_network_acl.public.id}"
  protocol       = "${local.public_inbound_acl_open ? "all" : var.public_inbound_acls[count.index] == "icmp" ? "icmp" : "tcp"}"
  rule_action    = "allow"
  rule_number    = "${100 + count.index * 10}"
  from_port      = "${lookup(local.tcp_rules, format(local.acl_fmt, var.public_inbound_acls[count.index], "from"))}"
  to_port        = "${lookup(local.tcp_rules, format(local.acl_fmt, var.public_inbound_acls[count.index], "to"))}"
  icmp_code      = -1
  icmp_type      = -1
}

resource "aws_network_acl_rule" "public_out" {
  count          = "${local.public_outbound_acl_open ? "1" : length(var.public_outbound_acls)}"
  cidr_block     = "0.0.0.0/0"
  egress         = true
  network_acl_id = "${aws_network_acl.public.id}"
  protocol       = "${local.public_outbound_acl_open ? "all" : var.public_outbound_acls[count.index] == "icmp" ? "icmp" : "tcp"}"
  rule_action    = "allow"
  rule_number    = "${100 + count.index * 10}"
  from_port      = "${lookup(local.tcp_rules, format(local.acl_fmt, var.public_outbound_acls[count.index], "from"))}"
  to_port        = "${lookup(local.tcp_rules, format(local.acl_fmt, var.public_outbound_acls[count.index], "to"))}"
  icmp_code      = -1
  icmp_type      = -1
}

resource "aws_network_acl_rule" "private_in" {
  count          = "${local.private_inbound_acl_open ? "1" : length(var.private_inbound_acls)}"
  cidr_block     = "0.0.0.0/0"
  egress         = false
  network_acl_id = "${aws_network_acl.private.id}"
  protocol       = "${local.private_inbound_acl_open ? "all" : var.private_inbound_acls[count.index] == "icmp" ? "icmp" : "tcp"}"
  rule_action    = "allow"
  rule_number    = "${100 + count.index * 10}"
  from_port      = "${lookup(local.tcp_rules, format(local.acl_fmt, var.private_inbound_acls[count.index], "from"))}"
  to_port        = "${lookup(local.tcp_rules, format(local.acl_fmt, var.private_inbound_acls[count.index], "to"))}"
  icmp_code      = -1
  icmp_type      = -1
}

resource "aws_network_acl_rule" "private_out" {
  count          = "${local.private_outbound_acl_open ? "1" : length(var.private_outbound_acls)}"
  cidr_block     = "0.0.0.0/0"
  egress         = true
  network_acl_id = "${aws_network_acl.private.id}"
  protocol       = "${local.private_outbound_acl_open ? "all" : var.private_outbound_acls[count.index] == "icmp" ? "icmp" : "tcp"}"
  rule_action    = "allow"
  rule_number    = "${100 + count.index * 10}"
  from_port      = "${lookup(local.tcp_rules, format(local.acl_fmt, var.private_outbound_acls[count.index], "from"))}"
  to_port        = "${lookup(local.tcp_rules, format(local.acl_fmt, var.private_outbound_acls[count.index], "to"))}"
  icmp_code      = -1
  icmp_type      = -1
}
