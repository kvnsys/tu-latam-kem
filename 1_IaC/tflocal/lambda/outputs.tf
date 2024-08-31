output "lambda_function_arn" {
  value = aws_lambda_function.lambda_http_end.arn
}

output "api_gateway_url" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.aws_region}.amazonaws.com/prod/myresource"
}