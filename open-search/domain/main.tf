resource "aws_opensearch_domain" "aod" {
  domain_name    = var.domain_name
  engine_version = var.engine_version

  cluster_config {
    instance_type = var.instance_type
  }

  advanced_security_options {
    enabled                        = var.advanced_security_enabled
    anonymous_auth_enabled         = var.advanced_security_enabled_anonymous_auth_enabled
    internal_user_database_enabled = var.advanced_security_internal_user_database_enabled
    master_user_options {
      master_user_name     = var.master_user_name
      master_user_password = var.master_user_password
    }
  }

  encrypt_at_rest {
    enabled = var.encrypt_at_rest_enabled
  }

  domain_endpoint_options {
    enforce_https       = var.domain_endpoint_enforce_https
    tls_security_policy = var.domain_endpoint_tls_security_policy
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption_enabled
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.volume_size
  }
}

  tags = var.tags