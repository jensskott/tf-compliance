resource "google_storage_bucket" "team1" {
  name = "prefix-team1-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    team = "team1",
  }
}

resource "google_storage_bucket" "team2" {
  name = "prefix-team2-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    team = "team2",
  }
}

resource "google_storage_bucket" "team3" {
  name = "prefix-team3-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    team = "team3",
  }
}

resource "google_project_iam_member" "this" {
  member = "user:test@example.com"
  role   = "roles/owner"
}
