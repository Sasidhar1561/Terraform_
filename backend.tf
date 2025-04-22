terraform {
  backend "s3" {
    bucket = "terraformstatefile1981"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
