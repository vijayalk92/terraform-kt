# Create EC2 instance
# assign a static private Ip via network_interface
# Assign an encrypted EBS volume using a KMS key



resource "aws_subnet" "test-subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_id
  availability_zone = var.availability_zone_id

  tags = {
    Name = "mq-tf-kt-subnet"
  }
}

resource "aws_network_interface" "test-eni" {
  count       = var.instance_count
  subnet_id   = aws_subnet.test-subnet.id
  private_ip  = var.private_ip_ids[count.index]
  

  tags = {
    Name = "mq-tf-kt-eni"
  }
}


resource "aws_kms_key" "test-kms-key" {
  description = "KMS key for EBS volume encryption"
}

resource "aws_ebs_volume" "test-ebs-volume-encrypted" {
  count             = var.instance_count
  availability_zone = var.availability_zone_id
  size              = var.ebs_volume_size
  encrypted         = var.ebs_encrypted
  kms_key_id        = aws_kms_key.test-kms-key.arn

  tags = {
    Name = "mq-tf-kt-ebs-encrypted"
  }
}

resource "aws_instance" "test-ec2" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "mq-tf-kt-ec2"
  }

  network_interface {
    network_interface_id = aws_network_interface.test-eni[count.index].id
    device_index         = 0
  }
}

resource "aws_volume_attachment" "test-ebs-attachment" {
  count       = var.instance_count
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.test-ebs-volume-encrypted[count.index].id
  instance_id = aws_instance.test-ec2[count.index].id
}

resource "aws_security_group" "test-sg" {
  for_each    = var.sg_names
  name        = each.value
  vpc_id      = var.vpc_id
}