data "aws_subnet" "this" {
  count = var.create ? 1 : 0
  id    = var.subnet_ids[0]
}

resource "aws_security_group" "mwaa" {
  count       = var.create ? 1 : 0
  name_prefix = "${var.name}-sg-"
  description = "Security group for MWAA environment"
  vpc_id      = data.aws_subnet.this[0].vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

resource "aws_security_group_rule" "mwaa_sg_inbound" {
  count                    = var.create ? 1 : 0
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.mwaa[0].id
  security_group_id        = aws_security_group.mwaa[0].id
  description              = "Amazon MWAA inbound access"
}

resource "aws_security_group_rule" "mwaa_sg_outbound" {
  count             = var.create ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mwaa[0].id
  description       = "Amazon MWAA outbound access"
}
