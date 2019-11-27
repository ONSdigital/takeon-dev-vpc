# VPC
variable "my_ip" {
}

variable "gov_wifi_ip" {
}

variable "environment_name" {
}

variable "accountID" {
}

# RDS

# DB name can only contain lowercase letters
variable "DB_name"{
}

variable "resource_group" {
}

variable "DB_username" {
}

variable "DB_password" {
}

# Lambda

variable "function_name"{
}

# Subnet

variable "cidr_public"{
}

variable "cidr_public2"{
}

variable "cidr_private"{
}

variable "cidr_private2"{
}

variable "cidr_node"{
}