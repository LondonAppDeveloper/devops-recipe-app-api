##
# ECS Cluster for running app on Fargate.
##

resource "aws_ecs_cluster" "main" {
  name = "${local.prefix}-cluster"
}
