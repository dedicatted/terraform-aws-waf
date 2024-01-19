resource "aws_wafv2_web_acl" "external" {
  name  = "ExternalACL"
  scope = var.scope

  default_action {
    block {}
  }

  dynamic "rule" {
    for_each = toset(var.rules)
    content {
      name     = rule.value.name
      priority = rule.value.priority
      override_action {
        none {}
      }
      statement {
        managed_rule_group_statement {
          name        = rule.value.managed_rule_group_statement_name
          vendor_name = rule.value.managed_rule_group_statement_vendor_name
        }
      }
      visibility_config {
        cloudwatch_metrics_enabled = false
        metric_name                = rule.value.metric_name
        sampled_requests_enabled   = false
      }
    }
  }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "ExternalACL"
    sampled_requests_enabled   = true
  }
}
/*
resource "aws_wafv2_web_acl_association" "waf_alb" {
  resource_arn = var.resource_arn_for_association
  web_acl_arn  = aws_wafv2_web_acl.external.arn
}
*/