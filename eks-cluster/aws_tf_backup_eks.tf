terraform {
  backend "gcs" {
    bucket = "idp-devops-aws"
    prefix = "terraformAWSEKS.tfstate"
  }
}