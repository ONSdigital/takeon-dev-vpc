
# Dead letter queue
resource "aws_sqs_queue" "DLQ" {
  name = "${var.environment_name}-DLQ-Validation"

    tags = {
        App = "takeon"
    }
}

# TakeOn-DataPrep-Input

resource "aws_sqs_queue" "TakeOn-DataPrep-Input" {
  name = "${var.environment_name}-DataPrep-Input"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}

# TakeOn-Validation-HandledErrors

resource "aws_sqs_queue" "TakeOn-Validation-HandledErrors" {
  name = "${var.environment_name}-Validation-HandledErrors"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}

# TakeOn-Validation-Runner

resource "aws_sqs_queue" "TakeOn-Validation-Runner" {
  name = "${var.environment_name}-Validation-Runner"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}


# TakeOn-Validation-SaveToDB

resource "aws_sqs_queue" "TakeOn-Validation-SaveToDB" {
  name = "${var.environment_name}-Validation-SaveToDB"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}


# TakeOn-Validation-Wrangler

resource "aws_sqs_queue" "TakeOn-Validation-Wrangler" {
  name = "${var.environment_name}-Validation-Wrangler"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.DLQ.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}
