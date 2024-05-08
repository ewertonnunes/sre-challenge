resource "aws_lb" "app_load_balancer" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.sg_load_balancer.id]
  subnets            = var.subnets

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app_target_group" {
  name        = var.name
  target_type = "alb"
  port        = 8080
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    path     = "/"
    port     = 8080
    protocol = "HTTP"
  }
}

resource "aws_lb_listener" "app_alb_listener" {
  load_balancer_arn = aws_lb.app_load_balancer.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}