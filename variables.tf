variable "jms_fleet_agent_configurations" {
  description = <<EOT
Map of jms_fleet_agent_configurations, attributes below
Required:
    - fleet_id
Optional:
    - agent_polling_interval_in_minutes
    - is_capturing_ip_address_and_fqdn_enabled
    - is_collecting_managed_instance_metrics_enabled
    - is_collecting_usernames_enabled
    - is_libraries_scan_enabled
    - java_usage_tracker_processing_frequency_in_minutes
    - jre_scan_frequency_in_minutes
    - work_request_validity_period_in_days
    - linux_configuration (block):
        - exclude_paths (required)
        - include_paths (required)
    - mac_os_configuration (block):
        - exclude_paths (required)
        - include_paths (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - windows_configuration (block):
        - exclude_paths (required)
        - include_paths (required)
EOT

  type = map(object({
    fleet_id                                           = string
    agent_polling_interval_in_minutes                  = optional(number)
    is_capturing_ip_address_and_fqdn_enabled           = optional(bool)
    is_collecting_managed_instance_metrics_enabled     = optional(bool)
    is_collecting_usernames_enabled                    = optional(bool)
    is_libraries_scan_enabled                          = optional(bool)
    java_usage_tracker_processing_frequency_in_minutes = optional(number)
    jre_scan_frequency_in_minutes                      = optional(number)
    work_request_validity_period_in_days               = optional(number)
    linux_configuration = optional(object({
      exclude_paths = list(string)
      include_paths = list(string)
    }))
    mac_os_configuration = optional(object({
      exclude_paths = list(string)
      include_paths = list(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    windows_configuration = optional(object({
      exclude_paths = list(string)
      include_paths = list(string)
    }))
  }))
}

