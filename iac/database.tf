resource "docker_volume" "db_data" {
  name = "db-data-${terraform.workspace}"
}

resource "docker_container" "db" {
  name  = "db-${terraform.workspace}"
  image = "postgres:16"

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=appdb"
  ]

  ports {
    internal = 5432
    external = var.db_port
  }

  volumes {
    volume_name    = docker_volume.db_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = docker_network.red_backend.name
  }
}
