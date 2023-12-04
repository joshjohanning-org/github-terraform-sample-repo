variable "repositories" {
  description = "List of repositories to create in the GitHub organization"
  type = list(object({
    name       = string,
    visibility = string
  }))
  default = []
}

resource "github_repository" "repository" {
  provider = github.joshjohanning-org

  for_each = { for repository in var.repositories : repository.name => repository }

  name       = each.value.name
  visibility = each.value.visibility

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository_ruleset" "example" {
  provider = github.joshjohanning-org

  for_each = github_repository.repository

  name        = "example"
  repository  = each.value.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  # see docs https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset
  bypass_actors {
    actor_id    = 1
    actor_type  = "OrganizationAdmin"
    bypass_mode = "always"
  }

  rules {
    creation                = true
    update                  = true
    deletion                = true
    required_linear_history = true
    required_signatures     = true
  }
}