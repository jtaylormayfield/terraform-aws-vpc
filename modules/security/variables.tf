variable "private_inbound_acls" {
  description = "Canned inbound ACLs for private subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', and 'eph'."
  type        = "list"
}

variable "private_outbound_acls" {
  description = "Canned outbound ACLs for private subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', and 'eph'."
  type        = "list"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs."
  type        = "list"
}

variable "public_inbound_acls" {
  description = "Canned inbound ACLs for public subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', and 'eph'."
  type        = "list"
}

variable "public_outbound_acls" {
  description = "Canned outbound ACLs for public subnets. If all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', and 'eph'."
  type        = "list"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs."
  type        = "list"
}

variable "tag_env" {
  description = "Environment tag value."
}

variable "tag_name" {
  description = "Name tag value."
}

variable "vpc_id" {
  description = "VPC ID."
}
