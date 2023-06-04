terraform {
  backend "s3" {
    bucket = "petclinic-project"
    region = "eu-west-3"
    key = "jenkins-server/terraform.tfstate"
    access_key = "AKIAYMGXJUBJYQKNC7N6"
    secret_key = "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"
  }
}