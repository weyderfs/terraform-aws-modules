resource "aws_iam_role" "role" {
  name               = var.role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY

}

resource "aws_iam_role_policy_attachment" "policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = var.policy_role
}

resource "aws_backup_selection" "selection_by_tag" {
  iam_role_arn = var.selection_by_tag_iam_role_arn
  name         = var.name_selection_by_tag
  plan_id      = var.selection_by_tag_plan_id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = var.selection_tag_key_tag
    value = var.selection_tag_value_key_tag
  }

resource "aws_backup_selection" "selection_by_resource" {
   name         = var.selection_by_resource_name
   iam_role_arn = var.selection_by_resource_iam_role_arn  
   plan_id      = var.selection_by_resource_plan_id

   resources = var.selection_by_resource_list_resources
}

}