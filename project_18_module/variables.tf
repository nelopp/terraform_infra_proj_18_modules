# variable
variable "vpc_1_cidr_block" {
  default = "10.0.0.0/16"
}


# variable
variable "vpc_2_cidr_block" {
  default = "10.0.0.0/16"
}


# public_subnet_1 cidr block
variable "project_18_prod_pub_sub_1_cidr_block" {
  default = "10.0.0.0/24"
}


# public_subnet_2 cidr block
variable "project_18_prod_pub_sub_2_cidr_block" {
  default = "10.0.1.0/24"
}


# public_subnet_3 cidr block
variable "project_18_prod_pub_sub_3_cidr_block" {
  default = "10.0.2.0/24"
}


# private_subnet_1 cidr block
variable "project_18_prod_priv_sub_1_cidr_block" {
  default = "10.0.3.0/24"
}


# private_subnet_2 cidr block
variable "project_18_prod_priv_sub_2_cidr_block" {
  default = "10.0.4.0/24"
}


# public route table cidr block
variable "project_18_prod_pub_route_table_cidr_block" {
  default = "0.0.0.0/00"
}