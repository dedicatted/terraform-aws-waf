resource "aws_wafv2_regex_pattern_set" "common" {
  name  = "Common"
  scope = var.scope

  regular_expression {
    regex_string = var.regex_string
  }

}
resource "aws_wafv2_web_acl" "external" {
  name  = "ExternalACL"
  scope = var.scope

  default_action {
    block {}
  }
  rule {
    name     = "PreventHostInjections"
    priority = 0

    statement {
      regex_pattern_set_reference_statement {
        arn = aws_wafv2_regex_pattern_set.common.arn

        field_to_match {
          single_header {
            name = "host"
          }
        }

        text_transformation {
          priority = 0
          type     = "NONE"
        }
      }
    }

    action {
      allow {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "PreventHostInjections"
      sampled_requests_enabled   = true
    }
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

resource "aws_wafv2_web_acl_association" "waf_alb" {
  count        = var.association_WAF_with_alb_enabled ? 1 : 0
  resource_arn = var.resource_arn_for_association
  web_acl_arn  = aws_wafv2_web_acl.external.arn
}