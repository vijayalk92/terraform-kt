variable "vpc_id" {
  type        = string
  description = "VPC ID where the resources will be created"
}

variable "cidr_id" {
  type        = string
}

variable "availability_zone_id" {
  type        = string
  description = "Availability Zone for the resources"

}

variable "private_ip_ids" {
    type = list(string)
    description = "List of private IP addresses for the network interfaces"
}

variable "ami_id" {
    type = string
    description = "ami ID pulled from available AMI's for free tier"
}

variable "instance_count" {
  type        = number
  description = "Number of instances to create"
}

variable "ebs_volume_size" {
  type        = number
  description = "Size of the EBS volume"
}

variable "ebs_encrypted" {
  type        = bool
  description = "Whether the EBS volume should be encrypted"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instances"
}

variable "sg_names" {
  type = map(string)
  description = "Map of security group names to be created"
}