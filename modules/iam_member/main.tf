resource "google_project_iam_member" "this" {
  member = "user:test@example.com"
  role   = "roles/owner"
}
