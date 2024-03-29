variable "vpc_name" {
  type        = string
  default     = "cloudhats"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  type        = list(string)
  default     = ["ap-south-1a","ap-south-1b"]
}

variable "vpc_public_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "vpc_enable_nat_gateway" {
  type        = bool
  default     = false
}

variable "vpc_enable_vpn_gateway" {
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "Tags for 'true' the VPC resources"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "staging"
  }
}