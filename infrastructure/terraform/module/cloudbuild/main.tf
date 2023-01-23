#
# CloudBuild
#

variable "location" {
  description = "location"
  type        = string
}
variable "name" {
  description = "name"
  type        = string
}
variable "cloudrun_location" {
  description = "cloudrun_location"
  type        = string
}
variable "description" {
  description = "description"
  type        = string
}
variable "cloudrun_image" {
  description = "cloudrun image"
  type        = string
}
variable "cloudrun_repository" {
  description = "cloudrun repository"
  type        = string
}
variable "hostname" {
  description = "_GCR_HOSTNAME"
  type        = string
}
variable "service_name" {
  description = "cloudrun service name"
  type        = string
}
variable "github_owner" {
  description = "github owner"
  type        = string
}
variable "github_name" {
  description = "github repository name"
  type        = string
}
variable "github_push_branch" {
  description = "github trigger branch"
  type        = string
}

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