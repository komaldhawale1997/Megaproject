terraform {
  backend "s3" {
    bucket = "komkos3"
    key    = "terrafom.tfstate"
    region = "us-east-1"
  }
}