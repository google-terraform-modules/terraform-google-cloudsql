###############################
##         INSTANCE          ##
###############################
output "instance_sql_ipv4" {
  value       = "${google_sql_database_instance.new_instance_sql.ip_address.0.ip_address}"
  description = "The IPv4 address assigned for master"
}

output "instance_sql_ipv4_time_to_retire" {
  value       = "${google_sql_database_instance.new_instance_sql.ip_address.0.time_to_retire}"
  description = "The time this IP address will be retired, in RFC 3339 format"
}

output "users_self_link" {
  value       = "${google_sql_database_instance.new_instance_sql.self_link}"
  description = "The URL of the created resource"
}

output "server_ca_cert" {
  value       = "${google_sql_database_instance.new_instance_sql.server_ca_cert.0.cert}"
  description = "The CA Certificate used to connect to the SQL Instance via SSL"
}

output "server_ca_cert_common_name" {
  value       = "${google_sql_database_instance.new_instance_sql.server_ca_cert.0.common_name}"
  description = "The CN valid for the CA Cert"
}

output "server_ca_cert_create_time" {
  value       = "${google_sql_database_instance.new_instance_sql.server_ca_cert.0.create_time}"
  description = "Creation time of the CA Cert"
}

output "server_ca_cert_expiration_time" {
  value       = "${google_sql_database_instance.new_instance_sql.server_ca_cert.0.expiration_time}"
  description = "Expiration time of the CA Cert"
}

output "server_ca_cert_sha1_fingerprint" {
  value       = "${google_sql_database_instance.new_instance_sql.server_ca_cert.0.sha1_fingerprint}"
  description = "SHA Fingerprint of the CA Cert"
}
