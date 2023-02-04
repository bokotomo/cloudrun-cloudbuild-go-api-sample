terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }
  }
}

variable "project_id" {
  description = "gcp project id"
  type        = string
}

provider "google" {
  project = var.project_id
  region  = "asia-northeast1"
}

locals {
  repository_id         = "terra-test-cloudrun-sample-repo"
  cloudrun_service_name = "terra-test-cloudrun-sample"
  cloudrun_repo_image   = "cloudrun-go-api-sample-image"
  region                = "asia-northeast1"
}

# artifact_registryにrepositoryを作成する
module "artifact_registry" {
  source        = "../../module/artifact_registry"
  location      = local.region
  description   = "cloudrun sample docker repository"
  repository_id = local.repository_id
}

# cloudbuildにトリガーを作成する
# 先にGCPでプロジェクトをGithubリポジトリ認証する必要あり
module "cloudbuild" {
  source              = "../../module/cloudbuild"
  name                = "cloudbuild-sample-api"
  location            = "global"
  description         = "cloudrun sample codebuild"
  cloudrun_location   = local.region
  cloudrun_image      = local.cloudrun_repo_image
  cloudrun_repository = local.repository_id
  hostname            = "asia.gcr.io"
  service_name        = local.cloudrun_service_name
  github_owner        = "bokotomo"
  github_name         = "cloudrun-cloudbuild-go-api-sample"
  github_push_branch  = "^main$"
}

# cloudrunにサービスを作成する
# 先にimageがアップロードされてる必要あり
module "cloudrun" {
  source       = "../../module/cloudrun"
  location     = local.region
  service_name = local.cloudrun_service_name
  image        = "${local.region}-docker.pkg.dev/${var.project_id}/${local.repository_id}/${local.cloudrun_repo_image}"
}