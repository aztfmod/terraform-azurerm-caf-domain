locals {
  module_tag = {
    "module" = basename(abspath(path.module))
  }
  tags         = merge(var.tags, local.module_tag)
  arm_filename = "${path.module}/arm_domain.json"
}