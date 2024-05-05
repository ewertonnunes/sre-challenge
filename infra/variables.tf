/* variable environment {
  type = string
  default = dev
} */

/* variable aws_region {
  type = string
}

variable aws_access_key_id {
  type = string
}

variable aws_secret_access_key {
  type = string
}
 */

#ALB
variable name {
  type = string
}

variable subnets {
  type = list(string)
}

variable security_group_id {
  type = string
}

variable internal {
  type = bool
}

variable load_balancer_type {
  type = string
}
/* 
variable lb_protocol {
  type = string
}

variable lb_backend_port {
  type = number
}

#target groups
variable target_group_name {
  type = string
}

variable target_listener_port {
  type = number
}

variable target_listener_protocol {
  type = string
}
variable target_type {
  type = string
}
 */