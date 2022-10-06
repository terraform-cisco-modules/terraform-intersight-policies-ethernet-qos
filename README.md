<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/terraform-cisco-modules/terraform-intersight-policies-ethernet-qos/actions/workflows/terratest.yml/badge.svg)](https://github.com/terraform-cisco-modules/terraform-intersight-policies-ethernet-qos/actions/workflows/terratest.yml)
# Terraform Intersight Policies - Ethernet QoS
Manages Intersight Ethernet QoS Policies

Location in GUI:
`Policies` » `Create Policy` » `Ethernet QoS`

## Easy IMM

[*Easy IMM - Comprehensive Example*](https://github.com/terraform-cisco-modules/easy-imm-comprehensive-example) - A comprehensive example for policies, pools, and profiles.

## Example

### main.tf
```hcl
module "ethernet_qos_policy" {
  source  = "terraform-cisco-modules/policies-ethernet-qos/intersight"
  version = ">= 1.0.1"

  description  = "default Ethernet QoS Policy."
  name         = "default"
  organization = "default"
  mtu          = 9216
  priority     = "Platinum"
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_burst"></a> [burst](#input\_burst) | The burst traffic, in bytes, allowed on the vNIC.  Value can be between 1024-1000000. | `number` | `1024` | no |
| <a name="input_cos"></a> [cos](#input\_cos) | Class of Service to be associated to the traffic on the virtual interface.  Value can be between 0-6. For FIAttached this should always be 0. | `number` | `0` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the Policy. | `string` | `""` | no |
| <a name="input_enable_trust_host_cos"></a> [enable\_trust\_host\_cos](#input\_enable\_trust\_host\_cos) | Enables usage of the Class of Service provided by the operating system. | `bool` | `false` | no |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | The Maximum Transmission Unit (MTU) or packet size that the virtual interface accepts.  Value can be between 1500-9000. | `number` | `1500` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Policy. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priortity matching the System QoS specified in the fabric profile.  Options are:<br>* Platinum<br>* Gold<br>* Silver<br>* Bronze<br>* Best Effort<br>* FC | `string` | `"Best Effort"` | no |
| <a name="input_rate_limit"></a> [rate\_limit](#input\_rate\_limit) | The value in Mbps (0-10G/40G/100G depending on Adapter Model) to use for limiting the data rate on the virtual interface. Setting this to zero will turn rate limiting off.  Range is between 0-100000. | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | Ethernet Qos Policy Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_vnic_eth_qos_policy.ethernet_qos](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_qos_policy) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->