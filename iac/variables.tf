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