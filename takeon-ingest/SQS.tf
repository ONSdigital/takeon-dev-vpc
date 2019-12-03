# Dead letter queue
resource "aws_sqs_queue" "DLQ" {
  name = "${var.environment_name}-DeadLetterQueue"

    tags = {
        App = "takeon"
    }
}

# TakeOn-DataPrep-Input

resource "aws_sqs_queue" "LandingZone" {
  name = "${var.environment_name}-LandingZone"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:${var.environment_name}-LandingZone",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.LZ.arn}" }
      }
    }
  ]
}
POLICY

    tags = {
        App = "takeon"
    }
}

# TakeOn-Validation-HandledErrors

resource "aws_sqs_queue" "IngestionZone" {
  name = "${var.environment_name}-IngestionZone"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}