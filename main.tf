resource "google_storage_bucket" "google_bucket" {
  name = "prefix-my-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    env  = "production",
    team = "devops",
  }
}

resource "google_storage_bucket" "google_bucket_two" {
  name = "my-bucket"

  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  labels = {
    team = "devops",
  }
}

module "iam_member" {
  source = "./modules/iam_member"
}

resource "google_project_iam_binding" "should_fail" {
  members = ["user:test@example.com"]
  role    = "roles/owner"
}

resource "google_project_iam_binding" "skip_check" {
  # checkov:skip=GC_02:Should be this binding here
  members = ["user:super@example.com"]
  role    = "roles/owner"
}

resource "google_project_iam_member" "that" {
  member = "user:test@example.com"
  role   = "roles/owner"
}