data "aws_route53_zone" "devops" {
  name         = "${var.route53_hosted_zone_name}."
  private_zone = false
}

resource "aws_route53_record" "k8-controller" {
  zone_id = "${data.aws_route53_zone.devops.zone_id}"
  name    = "k8.${data.aws_route53_zone.devops.name}"
  type    = "A"
  ttl     = "300"

  records = [
    "${aws_instance.controller.0.public_ip}",
    "${aws_instance.controller.1.public_ip}",
    "${aws_instance.controller.2.public_ip}",
  ]
}

resource "aws_route53_record" "k8-api-clb" {
  zone_id = "${data.aws_route53_zone.devops.zone_id}"
  name    = "k8api.${data.aws_route53_zone.devops.name}"
  type    = "A"

  alias {
    name                   = "${aws_elb.kubernetes_api.dns_name}"
    zone_id                = "${aws_elb.kubernetes_api.zone_id}"
    evaluate_target_health = false
  }
}

output "route53-k8-controller" {
  value = "${aws_route53_record.k8-controller.name}"
}
output "route53-k8api-controller" {
  value = "${aws_route53_record.k8-api-clb.name}"
}