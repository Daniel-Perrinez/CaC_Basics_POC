variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "wei-test-project"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "WEI-DevOps-Team"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default = {
    "Managed-by" = "Terraform"
    "Project"    = "Infrastructure"
  }
}

variable "additional_tags" {
  description = "Additional tags to be merged with common tags"
  type        = map(string)
  default     = {}
}

locals {
  tags = merge(
    var.common_tags,
    var.additional_tags,
    {
      Environment = var.environment
      Project     = var.project
      Owner       = var.owner
    }
  )
}