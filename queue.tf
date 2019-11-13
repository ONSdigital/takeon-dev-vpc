
# Dead letter queue
resource "aws_sqs_queue" "TakeOn-DLQ-Validation" {
  name = "TakeOn-DLQ-Validation"

    tags = {
        App = "takeon"
    }
}

# TakeOn-DataPrep-Input

resource "aws_sqs_queue" "TakeOn-DataPrep-Input" {
  name = "TakeOn-DataPrep-Input"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.TakeOn-DLQ-Validation.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}

# TakeOn-Validation-HandledErrors

resource "aws_sqs_queue" "TakeOn-Validation-HandledErrors" {
  name = "TakeOn-Validation-HandledErrors"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.TakeOn-DLQ-Validation.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}

# TakeOn-Validation-Runner

resource "aws_sqs_queue" "TakeOn-Validation-Runner" {
  name = "TakeOn-Validation-Runner"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.TakeOn-DLQ-Validation.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}


# TakeOn-Validation-SaveToDB

resource "aws_sqs_queue" "TakeOn-Validation-SaveToDB" {
  name = "TakeOn-Validation-SaveToDB"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.TakeOn-DLQ-Validation.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}


# TakeOn-Validation-Wrangler

resource "aws_sqs_queue" "TakeOn-Validation-Wrangler" {
  name = "TakeOn-Validation-Wrangler"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.TakeOn-DLQ-Validation.arn}\",\"maxReceiveCount\":3}"

    tags = {
        App = "takeon"
    }
}
