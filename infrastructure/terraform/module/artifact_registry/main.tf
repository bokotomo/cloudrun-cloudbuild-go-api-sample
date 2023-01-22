#
# Artifact Registry
#

variable "location" {
  description = "location"
  type        = string
}
variable "description" {
  description = "description"
  type        = string
}
variable "repository_id" {
  description = "repository_id"
  type        = string
}

resource "google_artifact_registry_repository" "terra-test-cloudrun-sample-repo" {
  location      = var.location
  repository_id = var.repository_id
  description   = var.description
  format        = "DOCKER"
}
