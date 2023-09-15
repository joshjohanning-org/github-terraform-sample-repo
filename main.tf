terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "joshjohanning-org"
  token = "abc"
#   app_auth {
#     id              = var.app_id              # or `GITHUB_APP_ID`
#     installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
#     pem_file        = file(var.app_pem_file)        # or `GITHUB_APP_PEM_FILE`
#   }
}

data "github_enterprise" "avocado" {
  slug = "avocado-corp"
}

resource "github_enterprise_organization" "joshjohanning-org" {
  enterprise_id = data.github_enterprise.avocado.id
  name          = "joshjohanning-org"
  description   = "josh's samples"
  billing_email = "joshjohanning@github.com"
  admin_logins  = [
    "joshjohanning"
  ]
}

resource "github_enterprise_organization" "joshjohanning-workflows" {
  enterprise_id = data.github_enterprise.avocado.id
  name          = "joshjohanning-workflows"
  billing_email = "joshjohanning@github.com"
  admin_logins  = [
    "joshjohanning"
  ]
}