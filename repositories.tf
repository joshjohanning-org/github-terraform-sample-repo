variable "repositories" {
  description = "List of repositories to create in the GitHub organization"
  type = list(object({
    name       = string,
    visibility = string
  }))
  default = []
}

resource "github_repository" "repository" {
  for_each = { for repository in var.repositories : repository.name => repository }
  provider = github.joshjohanning-org

  name       = each.value.name
  visibility = each.value.visibility

  lifecycle {
    prevent_destroy = true
  }
}
