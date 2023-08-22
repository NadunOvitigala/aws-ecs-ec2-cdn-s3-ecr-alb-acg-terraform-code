variable "s3_bucket_name" {
  type        = string
  default     = "cloudhats-frontend-staging"
}

variable "s3_bucket_acl" {
  type        = string
  default     = "private"
}

variable "s3_bucket_control_object_ownership" {
  type        = bool
  default     = true
}

variable "s3_bucket_object_ownership" {
  type        = string
  default     = "ObjectWriter"
}

variable "s3_bucket_versioning" {
  type        = map(bool)
  default     = {
    enabled = true
  }
}
variable "s3_bucket_name_log" {
  type        = string
  default     = "cloudhats-frontend-staging-logs"
}

# variable "s3_bucket_acl" {
#   type        = string
#   default     = "private"
# }

# variable "s3_bucket_control_object_ownership" {
#   type        = bool
#   default     = true
# }

# variable "s3_bucket_object_ownership" {
#   type        = string
#   default     = "ObjectWriter"
# }

# variable "s3_bucket_versioning" {
#   type        = map(bool)
#   default     = {
#     enabled = true
#   }
# }