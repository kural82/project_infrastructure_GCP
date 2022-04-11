module "account_setup" {
  source = "./module"
  account_setup = {
    billing_account_name = "My Billing Account"
    project_name         = "testprojectx"
    bucket_name          = "backend"
  }
}