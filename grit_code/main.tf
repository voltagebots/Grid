module "ec2" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  instance_count = 1
  name          = var.instance_name
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true

  user_data_base64 = base64encode("${path.cwd}/user_data.sh")

  tags = {
    "Env"      = "grid-dev"
    "Terraform" = "True"
  }
}

module "security_group" {
  source      = "github.com/terraform-aws-modules/terraform-aws-security-group"
  name        = "ec2-sg"
  description = "Security group for linux VM"
  vpc_id      = data.aws_vpc.main.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH Port"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "nginx port"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_cidr_blocks = ["172.31.0.0/20"]
  ingress_rules       = ["all-icmp"]
  egress_rules        = ["all-all"]

  tags = {
    Name = "grid=dev"
    Terraform = "True"
  }
}