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
  name     = var.service_name
  location = var.location
  autogenerate_revision_name = true

  template {
    spec {
      timeout_seconds       = 300
      # 同時接続数:トラフィックに対してのシステムの負荷強度によって変える
      container_concurrency = 80
      containers {
        image = var.image
      }
    }

    metadata {
      annotations = {
        # コールドスタート対策はminScale1以上
        "autoscaling.knative.dev/minScale" = "0"
        "autoscaling.knative.dev/maxScale" = "1000"
        "run.googleapis.com/client-name"   = "terraform"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
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