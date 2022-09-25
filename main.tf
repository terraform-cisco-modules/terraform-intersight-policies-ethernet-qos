#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = {
    for v in [var.organization] : v => v if length(
      regexall("[[:xdigit:]]{24}", var.organization)
    ) == 0
  }
  name = each.value
}

#__________________________________________________________________
#
# Intersight Ethernet QoS Policy
# GUI Location: Policies > Create Policy > Ethernet QoS
#__________________________________________________________________

resource "intersight_vnic_eth_qos_policy" "ethernet_qos" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  description    = var.description != "" ? var.description : "${var.name} Ethernet QoS Policy."
  name           = var.name
  burst          = var.burst
  cos            = var.cos
  mtu            = var.mtu
  priority       = var.priority
  rate_limit     = var.rate_limit
  trust_host_cos = var.enable_trust_host_cos
  organization {
    moid = length(
      regexall("[[:xdigit:]]{24}", var.organization)
      ) > 0 ? var.organization : data.intersight_organization_organization.org_moid[
      var.organization].results[0
    ].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
