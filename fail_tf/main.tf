resource "google_storage_bucket" "team1" {
  name = "prefix-team1-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "team2" {
  name = "prefix-team2-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    env = "prod",
  }
}

resource "google_storage_bucket" "team3" {
  name = "prefix-team3-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    team = "no_team",
  }
}

resource "google_project_iam_policy" "project" {
  project     = "your-project-id"
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:jane@example.com",
    ]
  }
}