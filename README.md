# AWS WAF
This page contains accurate information on how to configure AWS WAF using Terraform. <br>
The ACL includes three managed AWS rules:
- AWS-AWSManagedRulesCommonRuleSet
- AWS-AWSManagedRulesLinuxRuleSet
- AWS-AWSManagedRulesKnownBadInputsRuleSet
In case if you need add some rules, you can overwrite rules values.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.40 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_wafv2_web_acl.external](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | AWS Deployment region.. | `string` | `"us-east-1"` | no |
| <a name="input_resource_arn_for_association"></a> [resource\_arn\_for\_association](#input\_resource\_arn\_for\_association) | ARN of your resorces that you want to attach with WAF.. | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | List of rules for creation AWS WAF acl. | `list(any)` | <pre>[<br>  {<br>    "managed_rule_group_statement_name": "AWSManagedRulesCommonRuleSet",<br>    "managed_rule_group_statement_vendor_name": "AWS",<br>    "metric_name": "AWS-AWSManagedRulesCommonRuleSet",<br>    "name": "AWS-AWSManagedRulesCommonRuleSet",<br>    "priority": 1<br>  },<br>  {<br>    "managed_rule_group_statement_name": "AWSManagedRulesLinuxRuleSet",<br>    "managed_rule_group_statement_vendor_name": "AWS",<br>    "metric_name": "AWS-AWSManagedRulesLinuxRuleSet",<br>    "name": "AWS-AWSManagedRulesLinuxRuleSet",<br>    "priority": 2<br>  },<br>  {<br>    "managed_rule_group_statement_name": "AWSManagedRulesKnownBadInputsRuleSet",<br>    "managed_rule_group_statement_vendor_name": "AWS",<br>    "metric_name": "AWS-AWSManagedRulesKnownBadInputsRuleSet",<br>    "name": "AWS-AWSManagedRulesKnownBadInputsRuleSet",<br>    "priority": 3<br>  }<br>]</pre> | no |
| <a name="input_scope"></a> [scope](#input\_scope) | Define scope parameter. If you want use regional based resorces (ALB, API Gateway etc.) you should paste REGIONAL, if you want use cloudfront paste CLOUDFRONT | `string` | `"REGIONAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_WebAcl"></a> [WebAcl](#output\_WebAcl) | n/a |
