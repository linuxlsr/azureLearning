locals {
  common_tags = {
    Environment   = var.environment
    Application   = var.application
    Creator       = var.creator
  }
}