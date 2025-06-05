locals {
  project = "gergo-github-runners"
  region  = "eu-central-1"

  github_app = {
    key_base64     = "U0hBMjU2OlJaRGJ4a2kxMFRTL1NkakdEeSsrRnFGMUg1OThkVEdYZGJGRythVHlvMU09Cg=="
    id             = "1368780"
  }

  organization_id      = "a-acbdef1234"
  organization_root_id = "a-ab12"

  management_account_id  = "012345678910"
  monitoring_account_id  = "012345678910"
  production_account_id  = "012345678910"
  development_account_id = "012345678910"

  management_account_email  = "management@example.com"
  monitoring_account_email  = "monitoring@example.com"
  production_account_email  = "production@example.com"
  development_account_email = "development@example.com"
}