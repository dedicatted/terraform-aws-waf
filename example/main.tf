module "waf" {
  source                           = "github.com/dedicatted/terraform-aws-waf"
  dns                              = "example.com"
  regex_string                     = ".*example\\.com"

  # If you want associate this WAF rule with existing load balancer you should specify this parameters
  association_WAF_with_alb_enabled = true
  resource_arn_for_association     = "loadbalancer_url"
}