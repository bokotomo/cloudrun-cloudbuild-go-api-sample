#
# Artifact Registry
#
resource "google_artifact_registry_repository" "terra-test-cloudrun-sample-repo" {
  location      = var.location
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"
}
