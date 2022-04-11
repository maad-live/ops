# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MANAGE A GITHUB ORGANIZATION
#   - manage blocked users
#   - manage projects
#   - manage memberships ( admins and members )
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES:
# ---------------------------------------------------------------------------------------------------------------------
# You can provide your credentials via the
#   GITHUB_TOKEN and
#   GITHUB_OWNER, environment variables,
# representing your Access Token and the organization, respectively.
# ---------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# EXAMPLE PROVIDER CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------

module "organization" {
  source  = "mineiros-io/organization/github"
  version = "~> 0.7.0"

  all_members_team_name       = "everyone"
  all_members_team_visibility = "closed"

  members = [
    "ibadullaev-inc4"
  ]

  admins = [
    "ibadullaev-inc4"
  ]

  # randomly chosen users, sorry for blocking you guys!
  blocked_users = [
    "Testuser1",
    "Testuser2",
  ]

  projects = [
    {
      name = "Test Project"
      body = "This is a test project created by Terraform"
    },
    {
      name = "Test Project without a body"
    }
  ]
}


module "contracts" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.7.0"
  name                = "scheduler"
  description         = "Scheduler App"
  visibility          = "private"
  auto_init           = false
  has_issues          = true
  issue_labels_create = false
}