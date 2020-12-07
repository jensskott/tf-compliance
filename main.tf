resource "google_storage_bucket" "google_bucket" {
  name = "my-bucket"

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