output "instance_sql_ipv4" {
    value = "${google_sql_database_instance.new_instance_sql.ip_address.0.ip_address}"
    description = "The IPv4 address assigned"
}

output "instance_sql_setting_version" {
    value = "${google_sql_database_instance.new_instance_sql.settings.version}"
    description = " Used to make sure changes to the settings block are atomic"
}

output "users_self_link" {
    value = "${google_sql_user.new_instance_sql_users.self_link}"
    description = "The URL of the created resource"
}