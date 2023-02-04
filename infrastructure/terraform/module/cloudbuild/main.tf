#
# CloudBuild
#
resource "google_cloudbuild_trigger" "cloudbuild_sample_api" {
  location    = var.location
  description = var.description
  name        = var.name
  filename    = "cloudbuild.yaml"
  substitutions = {
    _CLOUDRUN_IMAGE        = var.cloudrun_image
    _CLOUDRUN_REPOSITORY   = var.cloudrun_repository
    _CLOUDRUN_REGION       = var.cloudrun_location
    _DEPLOY_REGION         = var.cloudrun_location
    _GCR_HOSTNAME          = var.hostname
    _SERVICE_CLOUDRUN_NAME = var.service_name
  }

  github {
    owner = var.github_owner
    name  = var.github_name
    push {
      branch = var.github_push_branch
    }
  }
}