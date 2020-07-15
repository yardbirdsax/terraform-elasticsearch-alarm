data aws_caller_identity current { }
resource aws_iam_role es_admin_role {
  name = "demoEsAdminRole"
  assume_role_policy = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [
      {
      "Action": "sts:AssumeRole",
      "Principal": {
          "AWS": "${data.aws_caller_identity.current.arn}"
      },
      "Effect": "Allow",
      "Sid": ""
      }
  ]
}
JSON
}

module "elasticsearch" {
  providers = {
    aws = aws
  }

  source                  = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=0.17.0"
  namespace               = "eg"
  stage                   = "dev"
  name                    = "es"
  zone_awareness_enabled  = "false"
  elasticsearch_version   = "7.4"
  instance_type           = "t2.small.elasticsearch"
  instance_count          = 1
  iam_role_arns           = [aws_iam_role.es_admin_role.arn]
  iam_actions             = ["es:ESHttpGet", "es:ESHttpPut", "es:ESHttpPost"]
  encrypt_at_rest_enabled = false
  kibana_subdomain_name   = "kibana-es"
  ebs_volume_size         = 10
  vpc_enabled             = false

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}

output es_domain_endpoint {
  value = module.elasticsearch.domain_endpoint
}