variable "aws_region" {
  default     = "us-east-2"
  description = "AWS region to use for API interaction."
}

variable "cidr" {
  default     = "10.87.0.0/16"
  description = "VPC CIDR block."
}

variable "internal_dns" {
  default     = true
  description = "Use AWS DNS services within the VPC."
}

variable "internal_hostnames" {
  default     = true
  description = "Use AWS-provided hostnames within the VPC."
}

variable "private_cidr" {
  default     = "10.87.0.0/24"
  description = "CIDR block of private IPs in the 'cidr' range."
}

variable "private_inbound_acls" {
  default     = ["all"]
  description = "Canned inbound ACLs for private subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'."
  type        = "list"
}

variable "private_outbound_acls" {
  default     = ["http", "https", "icmp"]
  description = "Canned outbound ACLs for private subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'."
  type        = "list"
}

variable "private_subnets" {
  default     = 1
  description = "Number of private subnets in the 'private_cidr' block."
}

variable "project_environment" {
  default     = "default"
  description = "Project environment, used for tagging AWS resources."
}

variable "project_name" {
  description = "Project name, used for tagging AWS resources."
}

variable "public_cidr" {
  default     = "10.87.1.0/24"
  description = "CIDR block of public IPs in the 'cidr' range."
}

variable "public_inbound_acls" {
  default     = ["http", "https", "ssh", "icmp", "nat"]
  description = "Canned inbound ACLs for public subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'."
  type        = "list"
}

variable "public_outbound_acls" {
  default     = ["http", "https", "icmp"]
  description = "Canned outbound ACLs for public subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'."
  type        = "list"
}

variable "public_subnets" {
  default     = 1
  description = "Number of public subnets in the 'public_cidr' block."
}