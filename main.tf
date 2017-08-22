resource "google_sql_database_instance" "new_instance_sql" {
  name = "${var.name}"

  region = "${var.region}"
  database_version = "${var.database_version}"

  settings {
    tier = "${var.instance_size}"
    disk_type       = "${var.disk_type}"
    disk_size       = "${var.disk_size}"
    disk_autoresize = "${var.disk_autoresize}"

    ip_configuration {
      authorized_networks = {
        name = "First access"
        value = "${var.cidr_ip_access}"
      }
    }

    location_preference {
      zone = "${var.region}-${var.zone}"
    }

    backup_configuration {
      binary_log_enabled = "${var.backup_binary_log_enabled}"
      enabled            = "${var.backup_enabled}"
      start_time         = "${var.backup_start_time}"
    }

    maintenance_window {
      day = "${var.maintenance_window_day}"
      hour = "${var.maintenance_window_hour}"
    }
  }
}

resource "google_sql_user" "new_instance_sql_users" {
  instance  = "${google_sql_database_instance.new_instance_sql.name}"
  host     = "${var.hostname}"
  name      = "${var.username}"
  password = "${var.password}"
}