resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Jayadeep"
    environment = "${var.environment}"
  }
  depends_on = [ aws_s3_bucket.tf-flowlogs-bucket-01 ]
}

resource "aws_flow_log" "example" {
  log_destination      = aws_s3_bucket.tf-flowlogs-bucket-01.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.default.id
  tags = {
    "Name" = "Flowlogs-Vpc"
  }
}
