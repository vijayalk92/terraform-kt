# Create EC2 instance
# assign a static private Ip via network_interface
# Assign an encrypted EBS volume using a KMS key



resource "aws_subnet" "test-subnet-02" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_id
  availability_zone = var.availability_zone_id

  tags = {
    Name = "mq-tf-kt-subnet"
  }
}

resource "aws_network_interface" "test-eni-02" {
  subnet_id   = aws_subnet.test-subnet-02.id
  private_ip = var.private_ip_id
  

  tags = {
    Name = "mq-tf-kt-eni"
  }
}


resource "aws_kms_key" "test-kms-key-02" {
  description = "KMS key for EBS volume encryption"
}

resource "aws_ebs_volume" "test-ebs-volume-encrypted-02" {
  availability_zone = "us-west-2a"
  size              = 1
  encrypted         = true
  kms_key_id        = aws_kms_key.test-kms-key-02.arn

  tags = {
    Name = "mq-tf-kt-ebs-encrypted"
  }
}

resource "aws_instance" "test-ec2-02" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  tags = {
    Name = "mq-tf-kt-ec2"
  }

  network_interface {
    network_interface_id = aws_network_interface.test-eni-02.id
    device_index         = 0
  }
}

resource "aws_volume_attachment" "test-ebs-attachment-02" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.test-ebs-volume-encrypted-02.id
  instance_id = aws_instance.test-ec2-02.id

  depends_on = [aws_instance.test-ec2-02]
}
