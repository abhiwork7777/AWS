terraform {
  backend "gcs" {
    bucket = "idp-cluster-tf-file"
    prefix = "terraformAWSEC2.tfstate"
  }
}