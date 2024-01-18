variable "region" {
  description = "AWS Deployment region.."
  default = "us-east-1"
  type = string
}

variable "resource_arn_for_association" {
  description = "ARN of your resorces that you want to attach with WAF.."
  type = string
}
variable "scope" {
  description = "Define scope parameter. If you want use regional based resorces (ALB, API Gateway etc.) you should paste REGIONAL, if you want use cloudfront paste CLOUDFRONT"
  type = string
  default = "REGIONAL"
}