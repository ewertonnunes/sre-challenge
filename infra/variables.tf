variable "name" {
  type        = string
  description = "Nome base da Aplicação"
}

variable "subnets" {
  type        = list(string)
  description = "Lista de Subnets"
}

variable "internal" {
  type        = bool
  description = "Orientação de conectividade do Load Balancer Internal False or True indica conexão publica ou privada para internet."
}

variable "load_balancer_type" {
  type        = string
  description = "Tipo de Load Balancer Ex: Network, Application"
}

variable "vpc_id" {
  type        = string
  description = "ID de identificação da VPC"
}

variable "eks_cluster_name" {
  type        = string
  description = "Nome do Cluster EKS na AWS"
}

variable "zone_id" {
  type        = string
  description = "Nome da Zona de DNS do Route53"
}