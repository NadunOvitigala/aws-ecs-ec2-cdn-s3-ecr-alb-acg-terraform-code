resource "aws_ecs_task_definition" "task-definition" {
  family                   = var.name
  requires_compatibilities = ["EC2"]
  cpu                      = var.cpu_units
  memory                   = var.memory
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.execution_role_arn
  container_definitions    = var.container_definition
}