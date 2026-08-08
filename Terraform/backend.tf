terraform {
  backend "s3" {
    bucket = "komukis3"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}