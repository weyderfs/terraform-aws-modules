
resource "aws_ecs_task_definition" "etd" {
  family                   = var.family
  requires_compatibilities = var.requires_compatibilities
  network_mode             = var.network_mode
  cpu                      = var.task_cpu
  memory                   = var.task_memory

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  # Container_definitions: Accepts direct JSON or jsonencoded from var.containers.
  container_definitions = (
    var.container_definitions != null &&
    var.container_definitions != ""
  ) ? var.container_definitions : jsonencode(var.containers)

  # Dynamic volume: only created if volume_name is not null.
  dynamic "volume" {
    for_each = var.volume_name != null ? [1] : []
    content {
      name = var.volume_name

      # EC2 bind-mount
      host_path = var.volume_host_path

      dynamic "docker_volume_configuration" {
        for_each = var.docker_volume_configuration != null ? [var.docker_volume_configuration] : []
        content {
          autoprovision = try(docker_volume_configuration.value.autoprovision, null)
          driver        = try(docker_volume_configuration.value.driver, null)
          driver_opts   = try(docker_volume_configuration.value.driver_opts, null)
          labels        = try(docker_volume_configuration.value.labels, null)
        }
      }

      dynamic "efs_volume_configuration" {
        for_each = var.efs_volume_configuration != null ? [var.efs_volume_configuration] : []
        content {
          file_system_id          = efs_volume_configuration.value.file_system_id
          root_directory          = try(efs_volume_configuration.value.root_directory, null)
          transit_encryption      = try(efs_volume_configuration.value.transit_encryption, null)
          transit_encryption_port = try(efs_volume_configuration.value.transit_encryption_port, null)

          dynamic "authorization_config" {
            for_each = try([efs_volume_configuration.value.authorization_config], [])
            content {
              access_point_id = try(authorization_config.value.access_point_id, null)
              iam             = try(authorization_config.value.iam, null)
            }
          }
        }
      }
    }
  }
  tags = var.tags
}
