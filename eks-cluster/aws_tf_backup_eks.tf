terraform {
  backend "gcs" {
    bucket = "idp-cluster-tf-file"
    prefix = "terraformAWSEKS.tfstate"
  }
}