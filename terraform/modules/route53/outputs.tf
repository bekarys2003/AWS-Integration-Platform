output "fqdn" {
  value = aws_route53_record.a_alias.fqdn
}

output "zone_id" {
  value = data.aws_route53_zone.public.zone_id
}
