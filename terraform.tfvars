# Global AWS configuration
region = "eu-north-1"
azs = [
  "eu-north-1a",
  "eu-north-1b",
]

# end

# VPC block
vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

# end