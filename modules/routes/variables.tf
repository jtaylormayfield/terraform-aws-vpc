variable "num_private_subnets" {
  description = "Number of private subnets."
}

variable "num_public_subnets" {
  description = "Number of public subnets."
}

variable "private_subnet_ids" {
  description = "Private subnet IDs."
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
