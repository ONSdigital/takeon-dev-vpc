# Set Provider as AWS and region
provider "aws" {
    region  = "eu-west-2"
    version = "2.31.0"
}

resource "aws_s3_bucket" "LZ" {
  bucket = "${var.environment_name}-landing-zone-bucket"
  acl    = "private"

  tags = {
    Name = "${var.environment_name}-LandingZone-Bucket"
    App  = "takeon"
  }
}

resource "aws_s3_bucket_notification" "LZ" {
  bucket = "${aws_s3_bucket.LZ.id}"

  queue {
    queue_arn = "${aws_sqs_queue.LandingZone.arn}"
    events = ["s3:ObjectCreated:*"]
  }
}

resource "aws_s3_bucket" "IZ" {
  bucket = "${var.environment_name}-ingestion-zone-bucket"
  acl    = "private"

  tags = {
    Name = "${var.environment_name}-IngestionZone-Bucket"
    App  = "takeon"
  }
}