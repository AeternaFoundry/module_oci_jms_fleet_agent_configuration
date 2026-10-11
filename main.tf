resource "oci_jms_fleet_agent_configuration" "jms_fleet_agent_configurations" {
  for_each = var.jms_fleet_agent_configurations

  fleet_id                                           = each.value.fleet_id
  agent_polling_interval_in_minutes                  = each.value.agent_polling_interval_in_minutes
  is_capturing_ip_address_and_fqdn_enabled           = each.value.is_capturing_ip_address_and_fqdn_enabled
  is_collecting_managed_instance_metrics_enabled     = each.value.is_collecting_managed_instance_metrics_enabled
  is_collecting_usernames_enabled                    = each.value.is_collecting_usernames_enabled
  is_libraries_scan_enabled                          = each.value.is_libraries_scan_enabled
  java_usage_tracker_processing_frequency_in_minutes = each.value.java_usage_tracker_processing_frequency_in_minutes
  jre_scan_frequency_in_minutes                      = each.value.jre_scan_frequency_in_minutes
  work_request_validity_period_in_days               = each.value.work_request_validity_period_in_days

  dynamic "linux_configuration" {
    for_each = each.value.linux_configuration != null ? [each.value.linux_configuration] : []
    content {
      exclude_paths = linux_configuration.value.exclude_paths
      include_paths = linux_configuration.value.include_paths
    }
  }

  dynamic "mac_os_configuration" {
    for_each = each.value.mac_os_configuration != null ? [each.value.mac_os_configuration] : []
    content {
      exclude_paths = mac_os_configuration.value.exclude_paths
      include_paths = mac_os_configuration.value.include_paths
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "windows_configuration" {
    for_each = each.value.windows_configuration != null ? [each.value.windows_configuration] : []
    content {
      exclude_paths = windows_configuration.value.exclude_paths
      include_paths = windows_configuration.value.include_paths
    }
  }
}

