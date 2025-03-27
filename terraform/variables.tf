variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "security_groups_name" {}
variable "security_groups_ports" {}
variable "protocol" {}

#variable "instance_name" {}
variable "instance_type" {}
variable "username" {}
variable "private_key_path" {}
# variable "ami" {}
# variable "key_name" {
#   description = "Nom de la clé SSH"
#   type        = string
# }

# variable "filename" {}
variable "region" {}
variable "stack" {
  description = "Nom du stack (docker ou kubernetes)"
  type        = string
  default     = "docker"

}