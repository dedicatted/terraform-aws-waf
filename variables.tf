variable "region" {
  description = "AWS Deployment region.."
  default     = "us-east-1"
  type        = string
}
variable "association_WAF_with_alb_enabled" {
  description = "Enabled association WAF rules with existing load balancer"
  type        = string
  default     = "false"
}
variable "resource_arn_for_association" {
  description = "ARN of your resorces that you want to attach with WAF.."
  type        = string
  default     = null
}
variable "scope" {
  description = "Define scope parameter. If you want use regional based resorces (ALB, API Gateway etc.) you should paste REGIONAL, if you want use cloudfront paste CLOUDFRONT"
  type        = string
  default     = "REGIONAL"
}
variable "rules" {
  type        = list(any)
  description = "List of rules for creation AWS WAF acl."
  default = [
    {
      name                                     = "AWS-AWSManagedRulesCommonRuleSet"
      priority                                 = 1
      managed_rule_group_statement_name        = "AWSManagedRulesCommonRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name                              = "AWS-AWSManagedRulesCommonRuleSet"
    },
    {
      name                                     = "AWS-AWSManagedRulesLinuxRuleSet"
      priority                                 = 2
      managed_rule_group_statement_name        = "AWSManagedRulesLinuxRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name                              = "AWS-AWSManagedRulesLinuxRuleSet"
    },
    {
      name                                     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      priority                                 = 3
      managed_rule_group_statement_name        = "AWSManagedRulesKnownBadInputsRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name                              = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    }
  ]
}
variable "dns" {
  description = "DNS name for AWS WAF protection"
  type        = string
}
variable "regex_string" {
  description = "Regex pattern which used in WAF rules ot protect host injection"
  type        = string
  default     = ""
}
