# github-terraform-sample-repo

This is a sample repo to demonstrate how to use Terraform to provision a GitHub enterprise organization.

The main branch uses a GitHub App b/c GitHub apps are better. 

The `use-pat` branch uses a PAT, which does allow you to do some enterprise-level things (like get Enterprise ID, etc.). GitHub Apps cannot be installed on an Enterprise so they cannot obtain Enterprise resources. 
