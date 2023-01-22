#
# Cloud Run
#

variable "location" {
  description = "location"
  type        = string
}
variable "image" {
  description = "image"
  type        = string
}
variable "service_name" {
  description = "cloud run service name"
  type        = string
}

resource "google_cloud_run_service" "terra-test-cloudrun-sample" {
  name                       = var.service_name
  location                   = var.location

  template {
    spec {
      containers {
        image = var.image
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "1000"
        "run.googleapis.com/client-name"   = "terraform"
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "noauth" {
  location = google_cloud_run_service.terra-test-cloudrun-sample.location
  service  = google_cloud_run_service.terra-test-cloudrun-sample.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}