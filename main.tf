/**
 * A Terraform module that provisions a generic AWS VPC.
 */

locals {
  tag_prefix_name = "${var.project_name}"
  tag_prefix_env  = "${var.project_environment}"
}

module "vpc" {
  source = "./modules/vpc"

  cidr               = "${var.cidr}"
  internal_dns       = "${var.internal_dns}"
  internal_hostnames = "${var.internal_hostnames}"
  peer_vpc_id        = "${var.peer_vpc_id}"
  tag_env            = "${local.tag_prefix_env}"
  tag_name           = "${local.tag_prefix_name}"
}

module "subnets" {
  source = "./modules/subnets"

  private_cidr    = "${var.private_cidr}"
  private_subnets = "${var.private_subnets}"
  public_cidr     = "${var.public_cidr}"
  public_subnets  = "${var.public_subnets}"
  tag_env         = "${local.tag_prefix_env}"
  tag_name        = "${local.tag_prefix_name}"
  vpc_id          = "${module.vpc.id}"
}

module "security" {
  source = "./modules/security"

  private_inbound_acls  = "${var.private_inbound_acls}"
  private_outbound_acls = "${var.private_outbound_acls}"
  private_subnet_ids    = "${module.subnets.private_ids}"
  public_inbound_acls   = "${var.public_inbound_acls}"
  public_outbound_acls  = "${var.public_outbound_acls}"
  public_subnet_ids     = "${module.subnets.public_ids}"
  tag_env               = "${local.tag_prefix_env}"
  tag_name              = "${local.tag_prefix_name}"
  vpc_id                = "${module.vpc.id}"
}

module "routes" {
  source = "./modules/routes"

  num_private_subnets = "${var.private_subnets}"
  num_public_subnets  = "${var.public_subnets}"
  private_subnet_ids  = "${module.subnets.private_ids}"
  public_subnet_ids   = "${module.subnets.public_ids}"
  tag_env             = "${local.tag_prefix_env}"
  tag_name            = "${local.tag_prefix_name}"
  vpc_id              = "${module.vpc.id}"
}
