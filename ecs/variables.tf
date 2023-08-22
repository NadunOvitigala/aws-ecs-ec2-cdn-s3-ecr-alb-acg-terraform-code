variable "ec2_sg" {
  type        = list(string)
}

variable "key" {
  default     = ""
}

variable "ami_id" {
  default     = ""
}

variable "instance_type" {
  default     = ""
}

variable "public_subnet_ids" {
  type        = list(string)
}