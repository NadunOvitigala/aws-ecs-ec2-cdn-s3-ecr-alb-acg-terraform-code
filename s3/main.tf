module "s3_bucket" {
  source                    = "terraform-aws-modules/s3-bucket/aws"

  bucket                    = var.s3_bucket_name
  acl                       = var.s3_bucket_acl

  control_object_ownership  = var.s3_bucket_control_object_ownership
  object_ownership          = var.s3_bucket_object_ownership

  versioning                = var.s3_bucket_versioning
}

module "s3_bucket_log" {
  source                    = "terraform-aws-modules/s3-bucket/aws"

  bucket                    = var.s3_bucket_name_log
  acl                       = var.s3_bucket_acl

  control_object_ownership  = var.s3_bucket_control_object_ownership
  object_ownership          = var.s3_bucket_object_ownership

  versioning                = var.s3_bucket_versioning
}