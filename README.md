# Google Cloud Platform - Cloud SQL

## Examples

* Standalone MySQL Instance (Zonal)
```
module "cloudsql-mysql" {
  source = "git::ssh://git@github.com:google-terraform-modules/terraform-google-cloudsql.git"

  general = {
    name       = "mydatabase"
    env        = "dev"
    region     = "europe-west1"
    db_version = "MYSQL_5_6"
  }

  instance = {
    zone = "b"
  }
}
```

* PostgreSQL Instance HA Cluster (Regional)
```
module "cloudsql-postgres-ha" {
  source = "git::ssh://git@github.com:google-terraform-modules/terraform-google-cloudsql.git"

  general = {
    name       = "mydatabase"
    env        = "dev"
    region     = "europe-west1"
    db_version = "POSTGRES_9_6"
  }

  instance = {
    zone              = "b"
    availability_type = "REGIONAL"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorized_gae_applications | A list of Google App Engine (GAE) project names that are allowed to access this instance | list | `<list>` | no |
| general | General configuration | map | - | yes |
| instance | Instance configuration | map | - | yes |
| labels | Global labels | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_sql_ipv4 | The IPv4 address assigned |
| instance_sql_ipv4_time_to_retire | The time this IP address will be retired, in RFC 3339 format |
| server_ca_cert | The CA Certificate used to connect to the SQL Instance via SSL |
| server_ca_cert_common_name | The CN valid for the CA Cert |
| server_ca_cert_create_time | Creation time of the CA Cert |
| server_ca_cert_expiration_time | Expiration time of the CA Cert |
| server_ca_cert_sha1_fingerprint | SHA Fingerprint of the CA Cert |
| users_self_link | The URL of the created resource |
