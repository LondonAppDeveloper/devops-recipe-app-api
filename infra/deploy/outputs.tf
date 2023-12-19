output "api_endpoint" {
  value = aws_route53_record.app.fqdn
}
