variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}
