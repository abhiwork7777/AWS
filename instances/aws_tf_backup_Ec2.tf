terraform {
  backend "gcs" {
    bucket = "idp-devops-aws"
    prefix = "terraformAWSEC2.tfstate"
  }
}