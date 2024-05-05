resource "aws_security_group" "sg_load_balancer" {
  name        = "sg_load_balancer-${var.name}"
  description = "Security Group para uso do LB ${var.name}."
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}