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
