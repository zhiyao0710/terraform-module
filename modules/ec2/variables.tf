variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
