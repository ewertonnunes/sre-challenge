resource "aws_lb" "app_load_balancer" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.sg_load_balancer.id]
  subnets            = var.subnets

  enable_deletion_protection = false
}
