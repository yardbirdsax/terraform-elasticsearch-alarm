module es_alarm {
  providers = {
    elasticsearch = elasticsearch
  }
  
  source = "../../terraform"

  monitor_interval = 1
  monitor_interval_unit = "HOURS"
  monitor_indices = ["cloudwatch-*"]
  monitor_query_json = <<JSON
{
  "size": 0,
  "aggregations": {},
  "query": {
    "bool": {
      "filter": {
        "range": {
          "@timestamp": {
            "gte": "||-1h",
            "lte": "",
            "format": "epoch_millis"
          }
        }
      }
    }
  }
}
JSON
}