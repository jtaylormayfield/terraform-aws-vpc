variable "cidr" {
  description = "VPC CIDR block."
}

variable "internal_dns" {
  description = "Use AWS DNS services within the VPC."
}

variable "internal_hostnames" {
  description = "Use AWS-provided hostnames within the VPC."
}

variable "peer_vpc_id" {
  description = "Peer VPC ID. Ignored if empty. Both VPCs must be in the same AWS account and region."
}

variable "tag_env" {
  description = "Environment tag value."
}

variable "tag_name" {
  description = "Name tag value."
}
