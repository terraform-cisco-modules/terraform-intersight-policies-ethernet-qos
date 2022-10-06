terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source                = "../.."
  burst                 = 1024
  cos                   = 0
  description           = "${var.name} Ethernet QoS Policy."
  enable_trust_host_cos = false
  mtu                   = 9000
  name                  = var.name
  organization          = "terratest"
  priority              = "Platinum"
  rate_limit            = 0
}
