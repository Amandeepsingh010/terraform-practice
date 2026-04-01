variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {}

variable "frontend_instance_id" {
  type = string
}

variable "backend_instance_id" {
  type = string
}