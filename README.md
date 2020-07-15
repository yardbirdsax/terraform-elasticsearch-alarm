# terraform-elasticsearch-alarm
A Terraform module that deploys an alarm (monitor, action, and triggers) to Elasticsearch.


## Pre-Requisites

1. Download the Elasticsearch Terraform provider.
    - OSX
    ```bash
    mkdir -p ~/.terraform.d/plugins/darwin_amd64
    curl -L -o ~/.terraform.d/plugins/darwin_amd64/terraform-provider-elasticsearch_v1.3.0 https://github.com/phillbaker/terraform-provider-elasticsearch/releases/download/v1.3.0/terraform-provider-elasticsearch_v1.3.0_darwin_amd64
    chmod +x ~/.terraform.d/plugins/darwin_amd64/terraform-provider-elasticsearch_v1.3.0
    ```