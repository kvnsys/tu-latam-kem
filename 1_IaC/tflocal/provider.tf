provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = var.aws_region
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localstack.tailscale:4566"
    apigatewayv2   = "http://localstack.tailscale:4566"
    cloudformation = "http://localstack.tailscale:4566"
    cloudwatch     = "http://localstack.tailscale:4566"
    dynamodb       = "http://localstack.tailscale:4566"
    ec2            = "http://localstack.tailscale:4566"
    es             = "http://localstack.tailscale:4566"
    elasticache    = "http://localstack.tailscale:4566"
    firehose       = "http://localstack.tailscale:4566"
    iam            = "http://localstack.tailscale:4566"
    kinesis        = "http://localstack.tailscale:4566"
    lambda         = "http://localstack.tailscale:4566"
    rds            = "http://localstack.tailscale:4566"
    redshift       = "http://localstack.tailscale:4566"
    route53        = "http://localstack.tailscale:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localstack.tailscale:4566"
    ses            = "http://localstack.tailscale:4566"
    sns            = "http://localstack.tailscale:4566"
    sqs            = "http://localstack.tailscale:4566"
    ssm            = "http://localstack.tailscale:4566"
    stepfunctions  = "http://localstack.tailscale:4566"
    sts            = "http://localstack.tailscale:4566"
  }
} 
