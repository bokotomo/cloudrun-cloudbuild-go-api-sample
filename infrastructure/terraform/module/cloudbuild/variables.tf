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