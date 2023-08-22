variable "alb" {
   default = ""
}

variable "health_check" {
   type = map(string)
   default = {
      "timeout"  = "10"
      "interval" = "20"
      "path"     = "/health"
      "port"     = "3000"
      "unhealthy_threshold" = "2"
      "healthy_threshold" = "3"
    }
}

variable "vpc_id" {
  default     = ""
}
