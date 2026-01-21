terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "joshjohanning-emu"
  token = "abc"
  #   app_auth {
  #     id              = var.app_id              # or `GITHUB_APP_ID`
  #     installation_id = var.app_installation_id # or `GITHUB_APP_INSTALLATION_ID`
  #     pem_file        = file(var.app_pem_file)        # or `GITHUB_APP_PEM_FILE`
  #   }
}

data "github_external_groups" "example_external_groups" {}

locals {
  local_groups = data.github_external_groups.example_external_groups
}

# output "groups" {
#   value = local.local_groups
# }

# Add a team to the organization
resource "github_team" "some_team" {
  name        = "some-team"
  description = "Some cool team"
  privacy     = "closed"
}

resource "github_emu_group_mapping" "example_emu_group_mapping" {
  for_each = { for g in local.local_groups.external_groups : g.group_name => g if g.group_name == "tj-emu-aad" }


  team_slug = github_team.some_team.name # The GitHub team name to modify
  group_id  = each.value.group_id

  lifecycle {
  prevent_destroy = true
}
}


