terraform {
  backend "gcs" {
    bucket = "idp-devops-aws"
    prefix = "terraformAWSRDS.tfstate"
  }
}