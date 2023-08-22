module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "cloudhats.lk"
  zone_id      = "Z2ES7B9AZ6SHAE"

  subject_alternative_names = [
    "*.cloudhats.lk"
  ]

  wait_for_validation = true

  tags = {
    Name = "cloudhats.lk"
  }
}