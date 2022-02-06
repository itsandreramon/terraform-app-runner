output "url" {
  value = "https://${aws_apprunner_service.ar.service_url}"
}