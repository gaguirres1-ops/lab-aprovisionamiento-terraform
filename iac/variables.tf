variable "frontend_port" {
  type        = number
  description = "Puerto del frontend"
}

variable "backend_port" {
  type        = number
  description = "Puerto del backend"
}

variable "db_port" {
  type        = number
  description = "Puerto de PostgreSQL"
}

variable "postgres_user" {
  type        = string
  description = "Usuario de PostgreSQL"
}

variable "postgres_password" {
  type        = string
  description = "Contraseña de PostgreSQL"
  sensitive   = true
}

variable "backend_port" {
  type        = map(number)
  description = "Puerto externo de la primera réplica del backend por ambiente"
}

variable "backend_replicas" {
  type        = map(number)
  description = "Cantidad de réplicas del backend por ambiente"
}