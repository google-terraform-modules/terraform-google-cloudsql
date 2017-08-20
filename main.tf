resource "google_sql_database_instance" "master" {
  name = "${var.name}"

  region = "${var.region}"
  database_version = "${var.database_version}"

  settings {
    location_preference {
      zone = "${var.region}-${var.zone}"
    }

    tier = "${var.instance_size}"
    disk_type       = "${var.disk_type}"
    disk_size       = "${var.disk_size}"
    disk_autoresize = "${var.disk_autoresize}"

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

resource "google_sql_database" "users" {
  name      = "test-db"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
}