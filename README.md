# terraform-module-gcp-sql

## Example

```
module "sql" {
  source = "./sql"
  name = "${var.name}"
  region = "${var.region}"
  zone = "${var.zone}"
  database_version = "${var.database_version}"
  instance_size = "${var.instance_size}"
  disk_type = "${var.disk_type}"
  disk_size = "${var.disk_size}"
  disk_autoresize = "${var.disk_autoresize}"
  maintenance_window_day = "${var.maintenance_window_day}"
  maintenance_window_hour = "${var.maintenance_window_hour}"
  backup_binary_log_enabled = "${var.backup_binary_log_enabled}"
  backup_enabled = "${var.backup_enabled}"
  backup_start_time = "${var.backup_start_time}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backup_binary_log_enabled | Activating logs for backup | string | `false` | no |
| backup_enabled | Backup activation | string | `false` | no |
| backup_start_time | Start time of the daily backup | string | - | yes |
| database_version | Version of the database (MYSQL_5_6, MYSQL_5_7, POSTGRES_9_6) | string | `MYSQL_5_6` | no |
| disk_autoresize | Auto-resize of the disk if the starting size is exceeded | string | `true` | no |
| disk_size | Storage size in GB | string | - | yes |
| disk_type | Storage Type (SSD ..) | string | `PD_SSD` | no |
| instance_size | size of instance (ex: db-n1-standard-2) | string | `db-n1-standard-2` | no |
| maintenance_window_day | Day of maintenance (integer) | string | - | yes |
| maintenance_window_hour | Hour of maintenance (integer) | string | - | yes |
| name | Name of the SQL instance | string | - | yes |
| region | Region of the Instance | string | `europe-west1` | no |
| zone | Area of the instance (a, b, c, d, e) | string | - | yes |