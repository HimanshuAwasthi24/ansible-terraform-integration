variable "instance_type_value" {
  description = "instance type of ec2 machine"
}

variable "ami_value" {
  description = "ami id for ec2 machine"
}

variable "subnet_id_value" {
  description = "subnet for ec2 machine"
}

variable "vpc_id_value" {
  description = "vpc for ec2 machine"
}

variable "key_name_value" {
  description = "key name for ec2 machine"
}

variable "private_key_path" {
  description = "path to the private key file for SSH access"
}