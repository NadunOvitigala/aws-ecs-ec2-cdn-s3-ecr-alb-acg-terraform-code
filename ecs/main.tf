resource "aws_ecs_cluster" "cloudhats-api-staging" {
  name = "cloudhats-api-staging"
}

resource "aws_launch_configuration" "ec2" {
  image_id      = var.ami_id 
  instance_type = var.instance_type

  security_groups = var.ec2_sg
  key_name        = var.key
}

# resource "aws_security_group" "ecs_sg" {
#   name        = "ecs-security-group"
#   description = "Security group for ECS instances"

# 
# }

resource "aws_autoscaling_group" "cloudhats-api-staging" {
  name                 = "cloudhats-api-staging"
  launch_configuration = aws_launch_configuration.ec2.id
  min_size             = 0
  max_size             = 2
  desired_capacity     = 0

  vpc_zone_identifier  = var.public_subnet_ids
}

# resource "aws_ecs_task_definition" "example" {
#   family                   = "example-task"
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   execution_role_arn      = "arn:aws:iam::123456789012:role/ecs-task-execution-role"
# }

# resource "aws_ecs_service" "cloudhats-api-staging" {
#   name            = "cloudhats-api-staging"
#   cluster         = aws_ecs_cluster.cloudhats-api-staging.id
#   task_definition = aws_ecs_task_definition.example.arn
#   launch_type     = "EC2"
#   desired_count   = 2

#   network_configuration {
#     subnets = var.public_subnet_ids
#   }
# }
