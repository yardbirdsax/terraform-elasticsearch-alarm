resource elasticsearch_opendistro_monitor monitor {
  body = <<JSON
{
  "type": "monitor",
  "name": "test-monitor",
  "enabled": true,
  "schedule": {
    "period": {
      "interval": ${var.monitor_interval},
      "unit": "${var.monitor_interval_unit}"
    }
  },
  "inputs": [{
    "search": {
      "indices": ${jsonencode(var.monitor_indices)},
      "query": ${var.monitor_query_json}
    }
  }],
  "triggers": [{
    "name": "test-trigger",
    "severity": "1",
    "condition": {
      "script": {
        "source": "ctx.results[0].hits.total.value > 0",
        "lang": "painless"
      }
    },
    "actions": [{
      "name": "test-action",
      "destination_id": "ld7912sBlQ5JUWWFThoW",
      "message_template": {
        "source": "This is my message body."
      },
      "throttle_enabled": false,
      "subject_template": {
        "source": "TheSubject"
      }
    }]
  }]
}
JSON
}