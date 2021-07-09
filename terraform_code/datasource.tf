#VPC already exists
data "aws_vpc" "main" {
  id = var.vpc_id
}

#Get all subnet IDs
data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.main.id
}

#AMIs for the region
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}