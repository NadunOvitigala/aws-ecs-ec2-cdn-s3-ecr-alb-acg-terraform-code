variable "vpc_id" {
  default     = ""
}

variable "public_subnet_ids" {
  type        = list(string)
}

variable "security_group_alb_id" {
  type        = list(string)
}

variable "targetgroup_id" {
  default     = ""
}