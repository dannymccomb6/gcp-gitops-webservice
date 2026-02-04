variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  type    = string
  default = "europe-west1" # Free tier friendly
}

variable "zone" {
  type    = string
  default = "europe-west1-b"
}

variable "vpc_name" {
  default = "demo-vpc"
}

variable "subnet_cidr" {
  default = "10.10.0.0/24"
}
