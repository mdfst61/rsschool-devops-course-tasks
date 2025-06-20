# Terraform
`backend.tf` - reference to s3 bucket, s3 bucket was created manually
`main.tf` - main file. reference required providers and 
`providers.tf` - additional options for providers
`github_iam.tf` - file to create gihub action role, set it's permissions. And set OIDC auth.
`variables.tf` - file with variables
`versions.tf` - provider versions
`route_tables.tf` - route tables configuration
`subnets.tf` - subnets configuration
`nat_instance.tf` - NAT instance configuration, uses https://github.com/AndrewGuenther/fck-nat/tree/main
`internet_gateway.tf` - internet gateway configuration configuration
`security_groups.tf` - SG configuration
`vpc.tf` - configuration to create vpc
`terraform.tfvars` - file to store variable values

# VPC structure
![img.png](images/img.png)

# Github Actions
`terraform.yml` contains 3 jobs:
- terraform-check - runs terraform fmt
- terraform-plan - runs terraform plan, requires terraform-check completion. Uses OIDC for AWS auth
- terraform-apply - runs terraform apply, requires terraform-plan completion. Uses OIDC for AWS auth
