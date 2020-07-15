variable monitor_interval {
  type = number
  description = "The value to use for the monitor interval."
}

variable monitor_interval_unit {
  type = string
  description = "The type for the monitor interval. Should be one of MINUTES or HOURS."
}

variable monitor_indices {
  type = list(string)
  description = "The list of indices to qualify for the monitor."
}

variable monitor_query_json {
  type = string
  description = "The ES Query DSL JSON that will be used for the monitor."
}