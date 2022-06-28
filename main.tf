provider "aws" {
  region = "eu-west-1"
}
resource "aws_s3_bucket" "reto-davijim" {
  bucket = "mapfre-gitops-fbohorq"
  tags = {
    Name        = "reto-s3-davijim"
    Environment = "reto"
  }
}



resource "aws_s3_bucket_acl" "reto-davijim" {
  bucket = aws_s3_bucket.reto-davijim.id
  acl    = "public-read"
}