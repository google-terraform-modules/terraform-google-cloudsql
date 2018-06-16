locals {
  name_prefix = "${var.general["name"]}-${var.general["region"]}"
}

# Instance CloudSQL
# https://www.terraform.io/docs/providers/google/r/sql_database_instance.html
resource "google_sql_database_instance" "new_instance_sql" {
  name             = "${local.name_prefix}"
  region           = "${var.general["region"]}"
  database_version = "${lookup(var.general, "db_version", "MYSQL_5_7")}"

  settings {
    tier                        = "${lookup(var.instance, "tier", "db-f1-micro")}"
    disk_type                   = "${lookup(var.instance, "disk_type", "PD_SSD")}"
    disk_size                   = "${lookup(var.instance, "disk_size", 10)}"
    disk_autoresize             = "${lookup(var.instance, "disk_auto", true)}"
    activation_policy           = "${lookup(var.instance, "activation_policy", "ALWAYS")}"
    availability_type           = "${lookup(var.instance, "availability_type", "ZONAL")}"
    authorized_gae_applications = "${var.authorized_gae_applications}"
    user_labels                 = "${var.labels}"

    ip_configuration {
      require_ssl  = "${lookup(var.instance, "require_ssl", false)}"
      ipv4_enabled = "${lookup(var.instance, "ipv4_enabled", true)}"
    }

    location_preference {
      zone = "${var.general["region"]}-${var.instance["zone"]}"
    }

    backup_configuration {
      binary_log_enabled = false
      enabled            = "${lookup(var.general, "backup_enabled", true)}"
      start_time         = "${lookup(var.general, "backup_time", "02:30")}" # every 2:30AM
    }

    maintenance_window {
      day          = "${lookup(var.instance, "maintenance_day", 1)}"          # Monday
      hour         = "${lookup(var.instance, "maintenance_hour", 2)}"         # 2AM
      update_track = "${lookup(var.instance, "maintenance_track", "stable")}"
    }
  }
}
