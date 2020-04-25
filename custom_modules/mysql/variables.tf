#required
variable "resource_group_name" {
  description = "resource group for resource"
}

variable "admin_username" {
  description = "admin name"
}

variable "db_name" {
  description = "schema name"
}

variable "location" {
  description = "Azure region"
}

variable "password" {
  description = "admin password"
}

#optional
variable "backup_retention_days" {
  description = "number of days backup retained"
  default     = 7
}

variable "charset" {
  description = "character set for database"
  default     = "utf8"
}

variable "collation" {
  description = "database collation"
  default     = "utf8_unicode_ci"
}

variable "db_version" {
  description = "database engine version"
  default     = "5.7"
}

variable "sku_capacity" {
  description = "The scale up/out capacity, representing server's compute units."
  default     = 2
}

variable "sku_family" {
  description = "The family of hardware Gen4 or Gen5, before selecting your family check the product documentation for availability in your region."
  default     = "Gen5"
}

variable "sku_name" {
  description = "Specifies the SKU Name for this MySQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  default     = "B_Gen5_2"
}

variable "sku_tier" {
  description = "The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized."
  default     = "Basic"
}

variable "ssl_enforcement" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enforced and Disabled"
  default     = true
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  default     = 5120
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = "Disabled"
}

variable "auto_grow" {
  description = "allows storage volume to grow automatically. Enabled or Disabled"
  default     = "Disabled"
}

variable "tags" {
  description = "Tags are good, use them. Bad things happen if you don't..."
  default     = {}
}