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
  alias = "joshjohanning-org"

  owner = "joshjohanning-org"
  app_auth {
    id              = var.app_id              # or `GITHUB_APP_ID`
    installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
    pem_file        = file(var.app_pem_file)  # or `GITHUB_APP_PEM_FILE`
  }
}

provider "github" {
  alias = "joshjohanning-workflows"

  owner = "joshjohanning-workflows"
  app_auth {
    id              = var.app_id              # or `GITHUB_APP_ID`
    installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
    pem_file        = file(var.app_pem_file)  # or `GITHUB_APP_PEM_FILE`
  }
}

provider "github" {
  owner = "joshjohanning-workflows"
  #   token = "abc"
  app_auth {
    id              = var.app_id             # or `GITHUB_APP_ID`
    installation_id = "41851711"             # or `GITHUB_APP_INSTALLATION_ID`
    pem_file        = file(var.app_pem_file) # or `GITHUB_APP_PEM_FILE`
  }
}

import {
  provider = github.joshjohanning-org

  to = github_organization_settings.joshjohanning-org
  id = "joshjohanning-org"
}

resource "github_organization_settings" "joshjohanning-org" {
  provider = github.joshjohanning-org

  lifecycle {
    prevent_destroy = true
  }

  description                                    = "josh's samples"
  billing_email                                  = "joshjohanning@github.com"
  advanced_security_enabled_for_new_repositories = true
  dependabot_alerts_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories  = true
  members_can_create_private_repositories        = false
  members_can_create_public_repositories         = false
  members_can_create_repositories                = false
  secret_scanning_enabled_for_new_repositories   = true
  location                                       = "United States of America"
  blog                                           = "https://josh-ops.com"
}

import {
  provider = github.joshjohanning-workflows

  to = github_organization_settings.joshjohanning-workflows
  id = "joshjohanning-workflows"
}

resource "github_organization_settings" "joshjohanning-workflows" {
  provider = github.joshjohanning-workflows

  lifecycle {
    prevent_destroy = true
  }

  description                                    = "josh's workflow samples"
  billing_email                                  = "joshjohanning@github.com"
  advanced_security_enabled_for_new_repositories = true
  dependabot_alerts_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories  = true
  members_can_create_private_repositories        = false
  members_can_create_public_repositories         = false
  members_can_create_repositories                = false
  secret_scanning_enabled_for_new_repositories   = true
  location                                       = "United States of America"
  blog                                           = "https://josh-ops.com"
}
