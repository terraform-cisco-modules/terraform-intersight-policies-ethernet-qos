<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/terraform-cisco-modules/terraform-intersight-policies-adapter-configuration/actions/workflows/test.yml/badge.svg)](https://github.com/terraform-cisco-modules/terraform-intersight-policies-adapter-configuration/actions/workflows/test.yml)
# Terraform Intersight Policies - Ethernet QoS
Manages Intersight Ethernet QoS Policies

Location in GUI:
`Policies` » `Create Policy` » `Ethernet QoS`

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

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
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
$env:TF_VAR_secretkey="<secret-key-file-location>""
```
<!-- END_TF_DOCS -->