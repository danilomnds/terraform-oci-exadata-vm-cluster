variable "backup_network_nsg_ids" {
  type = list(string)
  default = null  
}

variable "backup_subnet_id" {
  type = string
}

variable "cloud_exadata_infrastructure_id" {
  type = string  
}

variable "cluster_name" {
  type = string
  default = null  
}

variable "compartment_id" {
  type = string  
}

variable "cpu_core_count" {
  type = number  
}

variable "data_collection_options" {
  type = object({
    is_diagnostics_events_enabled = optional(bool)
    is_health_monitoring_enabled = optional(bool)
    is_incident_logs_enabled = optional(bool)
  })
  default = null
}

variable "data_storage_percentage" {
  type = string
  default = null  
}

variable "data_storage_size_in_tbs" {
  type = number
  default = null  
}

variable "db_node_storage_size_in_gbs" {
  type = number
  default = null  
}

variable "db_servers" {
  type = list(string)
  default = null  
}

variable "defined_tags" {
  type    = map(string)
  default = null
}

variable "display_name" {
  type = string
}

variable "domain" {
  type = string
  default = null  
}

variable "file_system_configuration_details" {
  type = list(object({
    file_system_size_gb = optional(number)
    mount_point = optional(string)
  }))
  default = null
}

variable "freeform_tags" {
  type    = map(string)
  default = null
}

variable "gi_version" {
  type = string  
}

variable "hostname" {
 type = string  
}

variable "is_local_backup_enabled" {
  type = bool
  default = null  
}

variable "is_sparse_diskgroup_enabled" {
  type = bool
  default = null  
}

variable "license_model" {
  type = string
  default = "BRING_YOUR_OWN_LICENSE"  
}

variable "memory_size_in_gbs" {
  type = number
  default = null  
}

variable "nsg_ids" {
  type = list(string)
  default = null  
}

variable "ocpu_count" {
  type = string
  default = null
}

variable "private_zone_id" {
  type = string
  default = null  
}

variable "scan_listener_port_tcp" {
  type = number
  default = null  
}

variable "scan_listener_port_tcp_ssl" {
  type = number
  default = null  
}

variable "ssh_public_keys" {
  type = list(string)
  default = null  
}

variable "subnet_id" {
  type = string
  default = null  
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "system_version" {
  type = string
  default = null  
}

variable "time_zone" {
  type = string
  default = null  
}

variable "groups" {
  type    = list(string)
  default = []
}

variable "compartment" {
  type    = string
  default = null
}