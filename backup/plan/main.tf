resource "aws_backup_plan" "plan" {
  name = var.plan_name

  rule {

    rule_name           = var.plan_rule_name
    target_vault_name   = var.plan_target_vault_name
    schedule            = var.plan_schedule
    starting_window     = var.plan_starting_window
    completion_window   = var.plan_completion_window
    recovery_point_tags = var.plan_recovery_point_tags

    lifecycle {

        cold_storage_after  = var.lifecycle_cold_storage_after
        delete_after        = var.lifecycle_delete_after
    }

    copy_action {

        lifecycle               = var.copy_action_lifecycle
        destination_vault_arn   = var.copy_action_destination_vault_arn
    }
  }
}