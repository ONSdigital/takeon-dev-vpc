resource "aws_ecr_repository" "ui-repo" {
  name = "${var.environment_name}-ui"
  tags = {
      Name = "${var.environment_name}-ui-repo"
      App = "takeon"
  }
}

resource "aws_ecr_repository" "bl-repo" {
  name = "${var.environment_name}-bl"
  tags = {
      Name = "${var.environment_name}-bl-repo"
      App = "takeon"
  }
}

resource "aws_ecr_repository" "pl-repo" {
  name = "${var.environment_name}-pl"
  tags = {
      Name = "${var.environment_name}-pl-repo"
      App = "takeon"
  }
}

resource "aws_ecr_repository" "vpl-repo" {
  name = "${var.environment_name}-vpl"
  tags = {
      Name = "${var.environment_name}-vpl-repo"
      App = "takeon"
  }
}

resource "aws_ecr_repository" "graphql-repo" {
  name = "${var.environment_name}-graphql"
  tags = {
      Name = "${var.environment_name}-graphql-repo"
      App = "takeon"
  }
}
