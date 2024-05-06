resource "aws_route53_record" "app_cname" {
  zone_id = "Z02164713IB9NZTMDH6HU"
  name    = "app.ezton.net"
  type    = "CNAME"
  ttl     = 300

  weighted_routing_policy {
    weight = 90
  }

  set_identifier = "live"
  records        = [aws_lb.app_load_balancer.dns_name, ]
}
