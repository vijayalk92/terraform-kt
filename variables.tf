variable "vpc_id" {
  type        = string
  default     = "vpc-089be43939ff9cc44"
  description = "VPC ID where the resources will be created"
}

variable "cidr_id" {
    default = "172.31.64.0/24"
}

variable "availability_zone_id" {
  type        = string
  default     = "us-west-2a"
  description = "Availability Zone for the resources"
}