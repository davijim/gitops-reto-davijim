provider "aws" {
  region = "eu-west-1"
}
resource "aws_s3_bucket" "mapfre-gitops-davijim2" {
  bucket = "mapfre-gitops-davijim2"
  tags = {
    Name        = "reto-s3-davijim2"
    Environment = "reto"
  }
}



resource "aws_s3_bucket_acl" "mapfre-gitops-davijim2" {
  bucket = aws_s3_bucket.mapfre-gitops-davijim2.id
  acl    = "public-read"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.mapfre-gitops-davijim2.id
  key    = "index.html"
  source = "./index.html"
  etag = filemd5("./index.html")
}