resource "aws_appautoscaling_target" "dev_to_target-1" {
  max_capacity = 5
  min_capacity = 1
  resource_id = "service/${var.ecs_cluster}/service-1"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs-1"
}

resource "aws_appautoscaling_policy" "dev_to_cpu-1" {
  name = "dev-to-cpu-1"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.dev_to_target-1.resource_id
  scalable_dimension = aws_appautoscaling_target.dev_to_target-1.scalable_dimension
  service_namespace = aws_appautoscaling_target.dev_to_target-1.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}

#############################################################################
resource "aws_appautoscaling_target" "dev_to_target-2" {
  max_capacity = 5
  min_capacity = 1
  resource_id = "service/${var.ecs_cluster}/service-2"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs-2"
}

resource "aws_appautoscaling_policy" "dev_to_cpu-2" {
  name = "dev-to-cpu-2"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.dev_to_target-2.resource_id
  scalable_dimension = aws_appautoscaling_target.dev_to_target-2.scalable_dimension
  service_namespace = aws_appautoscaling_target.dev_to_target-2.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}

#############################################################################
resource "aws_appautoscaling_target" "dev_to_target-3" {
  max_capacity = 5
  min_capacity = 1
  resource_id = "service/${var.ecs_cluster}/service-3"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs-3"
}

resource "aws_appautoscaling_policy" "dev_to_cpu-3" {
  name = "dev-to-cpu-3"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.dev_to_target-3.resource_id
  scalable_dimension = aws_appautoscaling_target.dev_to_target-3.scalable_dimension
  service_namespace = aws_appautoscaling_target.dev_to_target-3.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}
#############################################################################
resource "aws_appautoscaling_target" "dev_to_target-4" {
  max_capacity = 5
  min_capacity = 1
  resource_id = "service/${var.ecs_cluster}/service-4"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs-4"
}

resource "aws_appautoscaling_policy" "dev_to_cpu-4" {
  name = "dev-to-cpu-4"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.dev_to_target-4.resource_id
  scalable_dimension = aws_appautoscaling_target.dev_to_target-4.scalable_dimension
  service_namespace = aws_appautoscaling_target.dev_to_target-4.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}
#############################################################################
resource "aws_appautoscaling_target" "dev_to_target-5" {
  max_capacity = 5
  min_capacity = 1
  resource_id = "service/${var.ecs_cluster}/service-5"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs-4"
}

resource "aws_appautoscaling_policy" "dev_to_cpu-5" {
  name = "dev-to-cpu-5"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.dev_to_target-5.resource_id
  scalable_dimension = aws_appautoscaling_target.dev_to_target-5.scalable_dimension
  service_namespace = aws_appautoscaling_target.dev_to_target-5.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}


#############################################################################
resource "aws_appautoscaling_target" "dev_to_target-6" {
  max_capacity = 5
  min_capacity = 1
  resource_id = "service/${var.ecs_cluster}/service-6"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs-6"
}

resource "aws_appautoscaling_policy" "dev_to_cpu-6" {
  name = "dev-to-cpu-6"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.dev_to_target-6.resource_id
  scalable_dimension = aws_appautoscaling_target.dev_to_target-6.scalable_dimension
  service_namespace = aws_appautoscaling_target.dev_to_target-6.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}




