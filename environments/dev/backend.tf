terraform {
  backend "s3"{
    bucket = "terraform-state-sayantan"
    key = "terraform.tfstate"
    region = "eu-north-1"
    encrypt = true
    //dynamodb_table = "terraform-lock"
   // use_lockfile = true

  }
}