variable "prefix" {
  type = string
}

variable "resource_group_name" {
  description = "(Required) Resource group name"
  type        = string
}

variable "tags" {
  description = "map of the tags to be applied"
  type        = map(string)
}

variable "name" {
  description = "(Required) Name of the Domain to be created"
  type        = string
}

variable "location" {
  description = "Default location to create the resources"
  type        = string
}

variable contract {
  description = "(Required) contract fields for the domain name registration"
  type = object({
    name_first  = string
    name_last   = string
    email       = string
    phone       = string
    job_title   = string
    address1    = string
    address2    = string
    postal_code = string
    state       = string
    city        = string
    country     = string
    auto_renew  = bool
  })
}

variable lock_zone {
  description = "(Required) Determines to put a Azure lock after creating the zone"
  type        = bool
  default     = false
}

variable lock_domain {
  description = "(Required) Determines to put a Azure lock after create the domain"
  type        = bool
  default     = false
}