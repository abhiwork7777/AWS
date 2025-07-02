terraform {
  backend "gcs" {
    bucket = "idp-devops-aws"
    prefix = "terraformAWSstorage.tfstate"
  }
}
