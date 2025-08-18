module terraform-kt-ec2 {
  source = "../modules/ec2"

  vpc_id              = "vpc-089be43939ff9cc44"
  cidr_id             = "172.31.89.0/24"
  availability_zone_id = "us-west-2a"
  instance_count      = 5
  private_ip_ids      = ["172.31.89.100", "172.31.89.101", "172.31.89.102", "172.31.89.103","172.31.89.104"]
  ebs_volume_size     = 1
  ebs_encrypted       = true
  ami_id              = "ami-0efdf839508ec2995"
  instance_type       = "t3.micro"
  sg_names           = {
    sg1 = "sec_group_1"
    sg2 = "sec_group_2"
    sg3 = "sec_group_3"
    sg4 = "sec_group_4"
    sg5 = "sec_group_5"
  }
}
