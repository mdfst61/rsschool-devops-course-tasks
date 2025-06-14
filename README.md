# Terraform
`main.tf` - main file. reference required providers and s3 bucket, s3 bucket was created manually
`providers.tf` - additional options for providers
`github_iam.tf` - file to create gihub action role, set it's permissions. And set OIDC auth.
`variables.tf` - file with variables

# Github Actions
`terraform.yml` contains 3 jobs:
- terraform-check - runs terraform fmt
- terraform-plan - runs terraform plan, requires terraform-check completion. Uses OIDC for AWS auth
- terraform-apply - runs terraform apply, requires terraform-plan completion. Uses OIDC for AWS auth
