A Terraform module that provisions a generic AWS VPC.


## Inputs

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
| cidr | VPC CIDR block. | string | `10.87.0.0/16` |
| internal_dns | Use AWS DNS services within the VPC. | string | `true` |
| internal_hostnames | Use AWS-provided hostnames within the VPC. | string | `true` |
| private_cidr | CIDR block of private IPs in the 'cidr' range. | string | `10.87.0.0/24` |
| private_inbound_acls | Canned inbound ACLs for private subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'. | list | `[ "all" ]` |
| private_outbound_acls | Canned outbound ACLs for private subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'. | list | `[ "http", "https", "icmp" ]` |
| private_subnets | Number of private subnets in the 'private_cidr' block. | string | `1` |
| project_environment | Project environment, used for tagging AWS resources. | string | `default` |
| project_name | Project name, used for tagging AWS resources. | string | - |
| public_cidr | CIDR block of public IPs in the 'cidr' range. | string | `10.87.1.0/24` |
| public_inbound_acls | Canned inbound ACLs for public subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'. | list | `[ "http", "https", "ssh", "icmp", "nat" ]` |
| public_outbound_acls | Canned outbound ACLs for public subnets. If 'all' is a value in the list, all ports will be open. Other values include 'http', 'https', 'ssh', 'icmp', and 'eph'. | list | `[ "http", "https", "ssh", "icmp", "eph" ]` |
| public_subnets | Number of public subnets in the 'public_cidr' block. | string | `1` |

## Outputs

| Name | Description |
|------|-------------|
| private_subnet_ids | - |
| public_nat_ip | - |
| public_subnet_ids | - |
| vpc_id | - |

