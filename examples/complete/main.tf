module "ethernet_qos_policy" {
  source  = "terraform-cisco-modules/policies-ethernet-qos/intersight"
  version = ">= 1.0.1"

  description  = "default Ethernet QoS Policy."
  name         = "default"
  organization = "default"
  mtu          = 9216
  priority     = "Platinum"
}
