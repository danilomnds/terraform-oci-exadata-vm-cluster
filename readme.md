# Module - Oracle Exadata Cloud VM Cluster
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![OCI](https://img.shields.io/badge/provider-OCI-red)](https://registry.terraform.io/providers/oracle/oci/latest)

Module developed to standardize the creation of Oracle Exadata Cloud VM Cluster.

## Compatibility Matrix

| Module Version | Terraform Version | OCI Version     |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.9.5            | 6.8.0           |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Default use case
```hcl
module "exa-<region>-<env>-<system>-vm<id>" {    
  source = "git::https://github.com/danilomnds/terraform-oci-exadata-vm-cluster?ref=v1.0.0"
  subnet_id                       = <snet exadata>
  backup_subnet_id                = <snet backup>
  cloud_exadata_infrastructure_id = <exadata infrastructure cluster id>
  compartment_id                  = <compartment_id>
  cpu_core_count                  = <0>
  display_name                    = "exa-vcp-prd-coe-vm001"
  gi_version                      = "19.0.0.0"
  hostname                        = "ociexa00XX"
  ssh_public_keys                 = var.ssh_public_keys_oci_exa_vcp_00XX
  license_model                   = "BRING_YOUR_OWN_LICENSE"
  time_zone                       = "America/Sao_Paulo"
  defined_tags = {
    "IT.area":"infrastructure"
    "IT.department":"ti"    
  }
}
output "display-name" {
  value = module.exa-<region>-<env>-<system>-vm<id>.name
}
output "exadata-id" {
  value = module.exa-<region>-<env>-<system>-vm<id>.id
}
```

## Default use case plus RBAC
```hcl
module "exa-<region>-<env>-<system>-vm<id>" {    
  source = "git::https://github.com/danilomnds/terraform-oci-exadata-vm-cluster?ref=v1.0.0"
  subnet_id                       = <snet exadata>
  backup_subnet_id                = <snet backup>
  cloud_exadata_infrastructure_id = <exadata infrastructure cluster id>
  compartment_id                  = <compartment_id>
  cpu_core_count                  = <0>
  display_name                    = "exa-vcp-prd-coe-vm001"
  gi_version                      = "19.0.0.0"
  hostname                        = "ociexa00XX"
  ssh_public_keys                 = var.ssh_public_keys_oci_exa_vcp_00XX
  license_model                   = "BRING_YOUR_OWN_LICENSE"
  time_zone                       = "America/Sao_Paulo"
  defined_tags = {
    "IT.area":"infrastructure"
    "IT.department":"ti"    
  }
  compartment = <compartment name>
  # GRP_OCI_APP-ENV is the Azure AD group that you are going to grant the permissions
  groups = ["OracleIdentityCloudService/GRP_OCI_APP-ENV", "group name 2"]
}  
output "display-name" {
  value = module.exa-<region>-<env>-<system>-vm<id>.name
}
output "exadata-id" {
  value = module.exa-<region>-<env>-<system>-vm<id>.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backup_network_nsg_ids | A list of the OCIDs of the network security groups (NSGs) that the backup network of this DB system belongs to | `list(string)` | n/a | No |
| backup_subnet_id | The OCID of the backup network subnet associated with the cloud VM cluster | `string` | n/a | `Yes` |
| cloud_exadata_infrastructure_id | The OCID of the cloud Exadata infrastructure resource | `string` | n/a | `Yes` |
| cluster_name | The cluster name for cloud VM cluster | `string` | n/a | No |
| compartment_id | the ocid of the compartment | `string` | n/a | `Yes` |
| cpu_core_count | the number of CPU cores to enable for a cloud VM cluster | `number` | n/a | `Yes` |
| data_collection_options | Indicates user preferences for the various diagnostic collection options for the VM cluster/Cloud VM cluster/VMBM DBCS | `object({})` | n/a | No |
| data_storage_percentage | The cluster name for cloud VM cluster | `string` | n/a | No |
| data_storage_size_in_tbs | The data disk group size to be allocated in TBs | `number` | n/a | No |
| db_node_storage_size_in_gbs | The local node storage to be allocated in GBs | `number` | n/a | No |
| db_servers | The list of DB servers | `list(string)` | n/a | No |
| defined_tags | Defined tags for this resource | `map(string)` | n/a | No |
| display_name | the user-friendly name for the cloud exadata infrastructure resource | `string` | n/a | `Yes` |
| domain | A domain name used for the cloud VM cluster | `string` | n/a | No |
| file_system_configuration_details | Details of the file system configuration of the VM cluster | `list(object({}))` | n/a | No |
| freeform_tags | Free-form tags for this resource | `map(string)` | n/a | No |
| gi_version |A valid Oracle Grid Infrastructure (GI) software version | `string` | n/a | `Yes` |
| hostname | The hostname for the cloud VM cluster | `string` | n/a | `Yes` |
| is_local_backup_enabled | If true, database backup on local Exadata storage is configured for the cloud VM cluster | `bool` | n/a | No |
| is_sparse_diskgroup_enabled | If true, the sparse disk group is configured for the cloud VM cluster | `bool` | n/a | No |
| license_model | If true, database backup on local Exadata storage is configured for the cloud VM cluster | `string` | `BRING_YOUR_OWN_LICENSE` | No |
| memory_size_in_gbs | The memory to be allocated in GBs | `number` | n/a | No |
| nsg_ids | The list of OCIDs for the network security groups (NSGs) to which this resource belongs | `list(string)` | n/a | No |
| ocpu_count | The number of OCPU cores to enable for a cloud VM cluster | `number` | n/a | No |
| private_zone_id | The private zone id in which DNS records need to be created | `string` | n/a | No |
| scan_listener_port_tcp | The TCP Single Client Access Name (SCAN) port| `number` | n/a | No |
| scan_listener_port_tcp_ssl | The TCPS Single Client Access Name (SCAN) port. The default port is 2484 | `number` | n/a | No |
| ssh_public_keys | The public key portion of one or more key pairs used for SSH access to the cloud VM cluster| `string` | n/a | No |
| subnet_id | The OCID of the subnet associated with the cloud VM cluster| `string` | n/a | No |
| subscription_id | the ocid of the subscription with which resource needs to be associated with | `string` | n/a | No |
| system_version | Operating system version of the image | `string` | n/a | No |
| time_zone | The time zone to use for the cloud VM cluster. For details, see Time Zones | `string` | n/a | No |
| groups | list of azure AD groups that will manage objects inside the bucket | `list(string)` | n/a | No |
| compartment | compartment name that will be used for policy creation | `string` | n/a | No |
| enable_group_access | enables the policy creation. If true the groups var should have a least one value | `bool` | `true` | No |

# Object variables for blocks

| Variable Name (Block) | Parameter | Description | Type | Default | Required |
|-----------------------|-----------|-------------|------|---------|:--------:|
| data_collection_options | is_diagnostics_events_enabled | Indicates whether diagnostic collection is enabled for the VM cluster/Cloud VM cluster/VMBM DBCS  | `bool` | n/a | No |
| data_collection_options | is_health_monitoring_enabled | Indicates whether health monitoring is enabled for the VM cluster / Cloud VM cluster / VMBM DBCS  | `bool` | n/a | No |
| data_collection_options | is_incident_logs_enabled | Indicates whether incident logs and trace collection are enabled for the VM cluster / Cloud VM cluster / VMBM DBCS | `bool` | n/a | No |
| file_system_configuration_details | file_system_size_gb |  The file system size to be allocated in GBs | `number` | n/a | No |
| file_system_configuration_details | mount_point | The mount point of file system | `string` | n/a | No |

## Output variables

| Name | Description |
|------|-------------|
| name | exadata vm cluster name|
| id | exadata vm cluster id |

## Documentation
Oracle Exadata Cloud VM Cluster: <br>
[https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/database_cloud_vm_cluster](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/database_cloud_vm_cluster)