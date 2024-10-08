resource "oci_database_cloud_vm_cluster" "exadata_vm_cluster" {
  backup_network_nsg_ids        = var.backup_network_nsg_ids
  backup_subnet_id = var.backup_subnet_id
  cloud_exadata_infrastructure_id             = var.cloud_exadata_infrastructure_id
  cluster_name = var.cluster_name
  compartment_id = var.compartment_id
  cpu_core_count              = var.cpu_core_count
  dynamic "data_collection_options" {
    for_each = var.data_collection_options != null ? [var.data_collection_options] : []
    content {
      is_diagnostics_events_enabled = lookup(data_collection_options.value, "is_diagnostics_events_enabled", null)
      is_health_monitoring_enabled = lookup(data_collection_options.value, "is_health_monitoring_enabled", null)
      is_incident_logs_enabled = lookup(data_collection_options.value, "is_incident_logs_enabled", null)
      }    
  }
  data_storage_percentage = var.data_storage_percentage
  data_storage_size_in_tbs = var.data_storage_size_in_tbs
  db_node_storage_size_in_gbs = var.db_node_storage_size_in_gbs
  db_servers = var.db_servers
  defined_tags  = local.defined_tags
  display_name  = var.display_name
  domain = var.domain
  dynamic "file_system_configuration_details" {
    for_each = var.file_system_configuration_details != null ? var.file_system_configuration_details : []
    content {
      file_system_size_gb = file_system_configuration_details.value.file_system_size_gb
      mount_point = file_system_configuration_details.value.mount_point
    }
  }  
  freeform_tags = var.freeform_tags
  gi_version = var.gi_version
  hostname = var.hostname
  is_local_backup_enabled = var.is_local_backup_enabled
  is_sparse_diskgroup_enabled = var.is_sparse_diskgroup_enabled
  license_model = var.license_model
  memory_size_in_gbs = var.memory_size_in_gbs
  nsg_ids = var.nsg_ids
  ocpu_count = var.ocpu_count
  private_zone_id = var.private_zone_id
  scan_listener_port_tcp = var.scan_listener_port_tcp
  scan_listener_port_tcp_ssl = var.scan_listener_port_tcp_ssl
  ssh_public_keys = var.ssh_public_keys
  subnet_id = var.subnet_id
  subscription_id = var.subscription_id
  system_version = var.system_version
  time_zone = var.time_zone
  lifecycle {
    ignore_changes = [
      defined_tags["IT.create_date"]
    ]
  }
  timeouts {
    create = "12h"
    delete = "6h"
  }
}

resource "oci_identity_policy" "exadata_vm_cluster_policy" {
  #if you are deploying the resource outside your home region uncomment the line below
  #provider   = oci.oci-gru
  depends_on = [oci_database_cloud_vm_cluster.exadata_vm_cluster]
  for_each = {
    for group in var.groups : group => group
    if var.groups != [] && var.compartment != null
  }
  compartment_id = var.compartment_id
  name           = "policy_${var.display_name}"
  description    = "allow one or more groups to read the exadata vm cluster"
  statements = [
    "Allow group ${each.value} to read cloud-vmclusters in compartment ${var.compartment}"
  ]
}