resource "aws_s3_bucket" "tf-flowlogs-bucket-01" {

  bucket = "tf-flowlogs-bucket-01"
  acl    = "private"

  tags = {
    Name        = "tf-flowlogs-bucket-01"
    Environment = "Dev"
  }
}
