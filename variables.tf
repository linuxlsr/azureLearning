# tags & basic vars
variable "repo" {
  description = "where code for resource resides"
}

variable "infra" {
  description = "specific code / repo for infrastructure"
}

variable "subscription_id" {}

variable "tenant_id" {
  description = "tenant id, should be pulled from key vault"
}

variable "environment" {
  description = "deployment env"
  default     = "dev"
}

variable "application" {
  description = "what app this resource is for"
  default     = "learning"
}

variable "creator" {
  description = "what IaC language"
  default     = "Terraform"
}

variable "location" {
  description = "region where resources are created"
  default     = "westus"
}

# security center
variable "security_center_alert_notifications" {
  default = "true"
}

variable "security_center_alerts_to_admins" {
  default = "true"
}

variable "security_center_contact_email" {}

variable "security_center_contact_phone" {}

variable "security_center_pricing_tier" {
  default = "Free"
}

variable "security_center_workspaces" {
  type = map(string)
}

# networking
variable "local_ip" {
  description = "for local access"
}

variable "local_ipv4" {
  description = "ip w/o mask"
}

variable "vpc_cidr" {
  description = "network cidr block"
  default     = "10.0.0.0/21"
}

variable "firewall_subnet" {
  description = "subnet for firewall"
  default     = "10.0.0.0/24"
}

variable "public1" {
  description = "public subnet1 cidr block"
  default     = "10.0.1.0/24"
}

variable "private2" {
  description = "subnet2 cidr block"
  default     = "10.0.2.0/24"
}

variable "private3" {
  description = "subnet3 cidr block"
  default     = "10.0.3.0/24"
}

variable "private4" {
  description = "subnet3 cidr block"
  default     = "10.0.4.0/24"
}

# virtual machine
variable "vmsize" {
  description = "compute vm instance size"
  default     = "Standard_B1ms"
}

variable "admin_username" {}

# monitoring
variable "action_group_active" {
  description = "switch to enable / diable action group alerting"
  default     = false
}
