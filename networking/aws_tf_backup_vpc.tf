terraform {
  backend "gcs" {
    bucket = "idp-cluster-tf-file"
    prefix = "terraformAWSVpc.tfstate"
  }
}