# github-terraform-sample-repo

This is a sample repo to demonstrate how to use Terraform to provision a GitHub enterprise organization.

The main branch uses a GitHub App b/c GitHub apps are better. 

The `use-pat` branch uses a PAT, which does allow you to do some enterprise-level things (like get Enterprise ID, etc.). GitHub Apps cannot be installed on an Enterprise so they cannot obtain Enterprise resources. 

## Commands

```
terraform init -upgrade # upgrade the github terraform provider
terraform fmt # format the code
tflint # lint the code (requires tflint to be installed)
tfsec --ignore-hcl-errors # security scan the code (requires tfsec to be installed)
terraform plan -var-file=repositories.tfvars # plan with vars
terraform apply -var-file=repositories.tfvars # apply with vars
```
