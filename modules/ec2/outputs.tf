output "subnet_id" {
  value       = aws_subnet.test-subnet.id
  description = "ID of the created subnet"
  }

output "security_group_ids" {
  value       = aws_instance.test-ec2[*].vpc_security_group_ids
  description = "List of security group IDs associated with the EC2 instances"
}

output "kms_key_arn" {
  value       = aws_kms_key.test-kms-key.arn
  description = "ARN of the created KMS key for EBS encryption"
}

output "network_interface_ids" {
  value       = aws_network_interface.test-eni[*].id
  description = "List of IDs of the created network interfaces"
}

output "private_ips" {
  value       = aws_network_interface.test-eni[*].private_ip
  description = "List of private IP addresses assigned to the network interfaces"
}

output "ebs_volume_ids" {
  value       = aws_ebs_volume.test-ebs-volume-encrypted[*].id
  description = "List of IDs of the created EBS volumes"
}
output "instance_ids" {
  value       = aws_instance.test-ec2[*].id
  description = "List of IDs of the created EC2 instances"
}
