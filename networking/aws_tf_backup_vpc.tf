terraform {
  backend "gcs" {
    bucket = "idp-devops-aws"
    prefix = "terraformAWSVpc.tfstate"
  }
}