variable "private_cidr" {
  description = "CIDR block of private IPs in the 'cidr' range."
}

variable "private_subnets" {
  description = "Number of private subnets in the 'private_cidr' block."
}

variable "public_cidr" {
  description = "CIDR block of public IPs in the 'cidr' range."
}

variable "public_subnets" {
  description = "Number of public subnets in the 'public_cidr' block."
}

variable "tag_env" {
  description = "Environment tag value."
}

variable "tag_name" {
  description = "Name tag value."
}

variable "vpc_id" {
  description = "VPC id."
}
