provider "aws" {
  region = "eu-west-1"
}
resource "aws_s3_bucket" "mapfre-gitops-davijim" {
  bucket = "mapfre-gitops-davijim"
  tags = {
    Name        = "reto-s3-davijim"
    Environment = "reto"
  }
}



resource "aws_s3_bucket_acl" "mapfre-gitops-davijim" {
  bucket = aws_s3_bucket.mapfre-gitops-davijim.id
  acl    = "public-read"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.mapfre-gitops-davijim.id
  key    = "index.html"
  source = "./index.html"
  etag = filemd5("./index.html")
}