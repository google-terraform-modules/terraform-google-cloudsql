variable "name" {
    type = "string"
    description = "Name of the SQL instance"
}

variable "region" {
    type = "string"
    default = "europe-west1"
    description = "Region of the Instance"
}

variable "zone" {
    type = "string"
    description = "Area of the instance (a, b, c, d, e)"
}

variable "database_version" {
    type = "string"
    default = "MYSQL_5_6"
    description = "Version of the database (MYSQL_5_6, MYSQL_5_7, POSTGRES_9_6)"
}

variable "instance_size" {
    type = "string"
    default = "db-n1-standard-2"
    description = "size of instance (ex: db-n1-standard-2)"
}

variable "disk_type" {
    type = "string"
    default = "PD_SSD"
    description = "Storage Type (SSD ..)"
}

variable "disk_size" {
    type = "string"
    description = "Storage size in GB"
}

variable "disk_autoresize" {
    type = "string"
    default = true
    description = "Auto-resize of the disk if the starting size is exceeded"
}

variable "cidr_ip_access" {
    type = "string"
    default = "0.0.0.0/0"
    description = "A CIDR notation IPv4 or IPv6 address that is allowed to access this instance"
}

variable "maintenance_window_day" {
    type = "string"
    description = "Day of maintenance (integer)"
}

variable "maintenance_window_hour" {
    type = "string"
    description = "Hour of maintenance (integer)"
}

variable "backup_binary_log_enabled" {
    type = "string"
    default = false
    description = "Activating logs for backup"
}

variable "backup_enabled" {
    type = "string"
    default = false
    description = "Backup activation"
}

variable "backup_start_time" {
    type = "string"
    description = "Start time of the daily backup"
}


// mysql user

variable "hostname" {
    type = "string"
    default = "%"
    description = "Hostname for accessing the database"
}

variable "username" {
    type = "string"
    default = "admin"
    description = "Username of the host to access the database"
}

variable "password" {
    type = "string"
    description = "Password of the host to access the database"
}