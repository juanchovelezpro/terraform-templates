variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "database_subnets" {
  type = list(string)
}

variable "enable_ipv6" {
  type = bool
}

variable "create_db_subnet_group" {
  type = bool
}

variable "db_subnet_group_name" {
  type = string
}

variable "enable_nat_gateway" {
  type = bool
}

variable "single_nat_gateway" {
  type = bool
}

variable "tags" {
  type = map(string)
}

