data "aws_route53_zone" "selected" {
  name         = "example.com."
  private_zone = false
}

resource "aws_route53_record" "vpn" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "vpn"
  type    = "A"
  ttl     = "300"
  records = [module.app_pritunl.vpn_public_ip_address]
}
