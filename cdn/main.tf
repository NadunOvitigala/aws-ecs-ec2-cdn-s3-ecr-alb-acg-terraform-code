module "cdn" {
  source = "terraform-aws-modules/cloudfront/aws"

  aliases = ["staging.cloudhats.lk"]

  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false

  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_one = "cloudhats-staging"
  }

  # logging_config = {
  #   bucket = var.s3_bucket_name_log
  # }

  origin = {
    s3 = {
      domain_name = "cloudhats-staging.s3.amazonaws.com"
      s3_origin_config = {
        origin_access_identity = "s3_bucket_one"
      }
    }
  }

  default_cache_behavior = {
    target_origin_id           = "s3"
    viewer_protocol_policy     = "allow-all"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

  viewer_certificate = {
    acm_certificate_arn = "Type Your acm_arn Here"
    ssl_support_method  = "sni-only"
  }
}