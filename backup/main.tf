resource "aws_backup_vault" "vault" {
    
  name              = var.name_vault
  kms_key_arn       = var.kms_key_arn
  recovery_points   = var.recovery_points

}

resource "aws_backup_plan" "plan" {
  name = var.name_plan

  rule {
    rule_name           = var.rule_name
    target_vault_name   = "${aws_backup_vault.plan.name}"
    schedule            = var.cron
    start_window        = var.start_window
    completion_window   = var.completion_window
    lifecycle           = var.lifecycle_plan
    recovery_point_tags = var.recovery_point_tags
    copy_action         = var.copy_action

  }
  
}

resource "aws_backup_selection" "selection" {
  iam_role_arn = "${aws_iam_role.selection.arn}"
  name         = var.name_selection
  plan_id      = "${aws_backup_plan.selection.id}"

  selection_tag {
    type  = var.type_tag
    key   = var.key_tag
    value = var.value_key_tag
  }
}



