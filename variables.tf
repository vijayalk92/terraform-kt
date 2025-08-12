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

variable "private_ip_id" {
    type = string
    default = "172.31.64.100"
    description = "private Ip"
}

variable "ami_id" {
    type = string
    default = "ami-0efdf839508ec2995"
    description = "ami ID pulled from available AMI's for free tier"
}