resource "aws_sqs_queue" "terraform_queue" {
  name                      = "stage-user-service-sqs"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.deadletter_queue.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue" "deadletter_queue" {
  name                       = "dlq-stage"
  message_retention_seconds  = 86400
  visibility_timeout_seconds = 60
}
