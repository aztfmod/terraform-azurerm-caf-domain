locals {
  convention       = "cafrandom"
  name_la          = "caftestlavalid"
  name_diags       = "caftestdiags"
  location         = "southeastasia"
  prefix           = ""
  postfix          = ""
  max_length       = 60
  enable_event_hub = false
  resource_groups = {
    test = {
      name     = "test-caf-domain"
      location = "southeastasia"
    },
  }
  tags = {
    environment = "DEV"
    owner       = "CAF"
  }

  ttl         = 10
  lock_zone   = true
  lock_domain = true

  # changes to below will not update Domain, destroy first and reapply
  contract = {
    name_first   = "John"
    name_last    = "Doe"
    email        = "test@contoso.com"
    phone        = "+65.12345678"
    organization = "Sandpit"
    job_title    = "Engineer"
    address1     = "Singapore"
    address2     = ""
    postal_code  = "018898"
    state        = "Singapore"
    city         = "Singapore"
    country      = "SG"
    auto_renew   = true
  }
}