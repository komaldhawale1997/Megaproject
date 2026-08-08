terraform {
  backend "s3" {
    bucket = "komkis3"
    key    = "terr.tfstate"
    region = "us-east-1"
  }
}