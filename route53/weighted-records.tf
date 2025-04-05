
resource "aws_route53_record" "blue" {
  zone_id = var.zone_id
  name    = "app.ssungz.net"
  type    = "A"
  alias {
    name                   = aws_lb.blue_ingress.dns_name
    zone_id                = aws_lb.blue_ingress.zone_id
    evaluate_target_health = true
  }
  set_identifier = "blue"
  weight         = 100
}

resource "aws_route53_record" "green" {
  zone_id = var.zone_id
  name    = "app.ssungz.net"
  type    = "A"
  alias {
    name                   = aws_lb.green_ingress.dns_name
    zone_id                = aws_lb.green_ingress.zone_id
    evaluate_target_health = true
  }
  set_identifier = "green"
  weight         = 0
}
