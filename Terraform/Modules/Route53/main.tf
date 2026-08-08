########################################
# Hosted Zone
########################################

resource "aws_route53_zone" "this" {
  name = var.domain_name
}

########################################
# Alias Record
########################################

resource "aws_route53_record" "this" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}