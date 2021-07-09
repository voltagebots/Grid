variable "vpc_id" {
  type = string
  default = "vpc-df9a33a2"
}

variable "subnet_id" {
  type = string
  default = "subnet-cb4ed3ad"
}
variable "instance_name" {
  description = "Name of Instance"
  type = string
  default = "grid-dev"
}

variable "instance_type" {
  description = "The type of ec2 instance to be provisioned"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH Key for Instance"
  type = string
  default =  "grid-dev"  
}