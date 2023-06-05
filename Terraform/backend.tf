terraform {
  backend "s3" {
    bucket = "petclinic-project"
    region = "eu-west-3"
    key = "jenkins-server/terraform.tfstate"
  }
}