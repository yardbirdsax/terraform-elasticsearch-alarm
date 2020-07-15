provider aws {
  region = "us-east-2"
}

provider elasticsearch {
  url = "https://${module.elasticsearch.domain_endpoint}"
  sign_aws_requests = true
}