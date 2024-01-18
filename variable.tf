variable "region" {
  description = "AWS Deployment region.."
  default = "us-east-1"
  type = string
}

variable "aws_lb_arn" {
  description = "ARN of your LoadBalance that you want to attach with WAF.."
  type = string
}
variable "dns" {
  description = "DNS name for AWS WAF protection"
  type = string
}