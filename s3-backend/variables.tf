variable "region" {
  type = string
}

variable "bucket_name" {
    type = string
}

variable "dynamo_table_name" {
  type = string
  default = "terraform-lock"
}