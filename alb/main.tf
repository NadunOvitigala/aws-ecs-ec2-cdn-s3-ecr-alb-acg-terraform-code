resource "aws_alb" "alb" {
  name            = "cloudhats-alb-staging"
  subnets         = var.public_subnet_ids
  security_groups = var.security_group_alb_id
  internal        = false
  idle_timeout    = "90"
}

resource "aws_alb_listener" "http_alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "https_alb_listener" {
 load_balancer_arn = aws_alb.alb.arn
 port              = "443"
 protocol          = "HTTPS"
 ssl_policy        = "ELBSecurityPolicy-2016-08"
 certificate_arn   = "arn:aws:acm:ap-south-1:225611973773:certificate/25badce2-cc73-4962-87e2-22805c6b8b58"
 default_action {
   type = "fixed-response"
   fixed_response {
     content_type = "text/plain"
     message_body = "Service Unavailable"
     status_code  = "503"
    }
 }
}

# resource "aws_security_group" "alb_sg" {
#   name        = "${var.project}-alb-sg-${var.environment}"
#   description = "Allow incoming HTTP/HTTPS connections for ALB"
#   vpc_id      = var.vpc_id
# }