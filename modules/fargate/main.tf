resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = var.cluster_arn
  task_definition = var.task_definition_arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count
  network_configuration {
    subnets          = var.subnet_ids
    assign_public_ip = true
    security_groups  = var.security_group_ids
  }
  # Add load balancer, etc. as needed
}

output "service_name" {
  value = aws_ecs_service.this.name
} 