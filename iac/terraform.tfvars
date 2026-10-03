frontend_port     = 4001
db_port           = 4003
postgres_user     = "admin"
postgres_password = "admin123"

backend_port = {
  dev = 4002
  qa  = 5002
}

backend_replicas = {
  dev = 1
  qa  = 2
}