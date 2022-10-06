resource "aws_s3_bucket" "my-bucket" {
  bucket = "ahmetguc-s3-test-bucket"

  tags = {
    Name        = "My S3 bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_object" "my-bucket-object" {
    bucket = aws_s3_bucket.my-bucket.id
    acl = "public-read"
    key = "index.html"
    source = "~/labs/Terraform-Labs/terraform-s3-demo/data/index.html"

tags = {
    Name    = "My S3 bucket file"
    Environment = "Dev"
    etag =  filemd5("/Users/ahmetemreguc/Terraform-Labs/terraform-multiple/data/index.html")
}
}