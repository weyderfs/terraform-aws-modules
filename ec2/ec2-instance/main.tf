data "aws_ami" "selected" {
  count = var.ami == null ? 1 : 0

  most_recent = true
  owners      = var.ami_filters.owners

  dynamic "filter" {
    for_each = var.ami_filters.filters
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

resource "aws_security_group" "instance" {
  name_prefix = "${var.name}-"
  description = "Security group for ${var.name} EC2 instance"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-sg"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

# SSH access from CIDR blocks
resource "aws_security_group_rule" "ssh_cidr" {
  count = length(var.allow_ssh_from_cidr_blocks) > 0 ? 1 : 0

  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allow_ssh_from_cidr_blocks
  security_group_id = aws_security_group.instance.id
  description       = "SSH access from CIDR blocks"
}

# SSH access from security groups
resource "aws_security_group_rule" "ssh_sg" {
  for_each = toset(var.allow_ssh_from_security_group_ids)

  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = each.value
  security_group_id        = aws_security_group.instance.id
  description              = "SSH access from security group"
}

# Custom port access from CIDR blocks
resource "aws_security_group_rule" "port_cidr" {
  for_each = var.allow_port_from_cidr_blocks

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = lower(each.value.protocol)
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.instance.id
  description       = "Port access from CIDR blocks - ${each.key}"
}

# Custom port access from security groups
resource "aws_security_group_rule" "port_sg" {
  for_each = var.allow_port_from_security_group_ids

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = lower(each.value.protocol)
  security_group_id = aws_security_group.instance.id
  description       = "Port access from security groups - ${each.key}"

  # Handle multiple security groups for each rule
  source_security_group_id = each.value.security_group_ids[0]
}

# Egress rule to allow all outbound traffic
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance.id
  description       = "Allow all outbound traffic"
}

# IAM role for EC2 instance
resource "aws_iam_role" "instance" {
  name_prefix = "${var.name}-"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-role"
    }
  )
}

resource "aws_iam_instance_profile" "instance" {
  name_prefix = "${var.name}-"
  role        = aws_iam_role.instance.name

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-profile"
    }
  )
}

# EC2 Instance
resource "aws_instance" "this" {
  ami                    = var.ami != null ? var.ami : data.aws_ami.selected[0].id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id[0]
  vpc_security_group_ids = [aws_security_group.instance.id]
  iam_instance_profile   = aws_iam_instance_profile.instance.name

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )

  lifecycle {
    ignore_changes = [ami]
  }
}

# Additional EBS volumes
resource "aws_ebs_volume" "additional" {
  for_each = var.ebs_volumes

  availability_zone = aws_instance.this.availability_zone
  size              = each.value.size
  type              = each.value.type
  encrypted         = each.value.encrypted
  iops              = each.value.iops
  throughput        = each.value.throughput

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-${each.key}"
    }
  )
}

resource "aws_volume_attachment" "additional" {
  for_each = var.ebs_volumes

  device_name = each.value.device_name
  volume_id   = aws_ebs_volume.additional[each.key].id
  instance_id = aws_instance.this.id
}

# Route53 DNS record
data "aws_route53_zone" "selected" {
  count = var.route53_zone_id != "" ? 1 : 0

  zone_id      = var.route53_zone_id
  private_zone = var.dns_zone_is_private
}

resource "aws_route53_record" "instance" {
  count = var.route53_zone_id != "" && var.route53_lookup_domain_name != "" ? 1 : 0

  zone_id = var.route53_zone_id
  name    = var.route53_lookup_domain_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.this.private_ip]
}
