variable "name" {
  type = string
}

variable "ingress_port" {
  type = number
}

variable "cidr_blocks" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

