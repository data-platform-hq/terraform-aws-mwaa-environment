output "arn" {
  description = "The ARN of the MWAA Environment"
  value       = try(aws_mwaa_environment.this[0].arn, null)
}

output "webserver_url" {
  description = "The webserver URL of the MWAA Environment"
  value       = try(aws_mwaa_environment.this[0].webserver_url)
}
