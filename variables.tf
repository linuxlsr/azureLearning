variable "tenant_id" {
  description = "tenant id, should be pulled from key vault"
}

variable "local_ip" {
  description = "for local access"
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

variable "vpc_cidr" {
  description = "network cidr block"
  default     = "10.0.0.0/22"
}

variable "public0" {
  description = "public subnet1 cidr block"
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

variable "vmsize" {
  description = "compute vm instance size"
  default     = "Standard_B1ms"
}

variable "action_group_active" {
  description = "switch to enable / diable action group alerting"
  default     = false
}