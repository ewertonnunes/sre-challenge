variable "name" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "internal" {
  type = bool
}

variable "load_balancer_type" {
  type = string
}

variable "vpc_id" {
  type = string
}