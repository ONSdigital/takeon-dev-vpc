resource "aws_ecr_repository" "takeon-dev-ui-repo" {
  name = "takeon-dev-ui"
  tags = {
      Name = "takeon-dev-ui-repo"
      App = "takeon-dev-ui-repo"
  }
}

resource "aws_ecr_repository" "takeon-dev-bl-repo" {
  name = "takeon-dev-bl"
  tags = {
      Name = "takeon-dev-bl-repo"
      App = "takeon-dev-bl-repo"
  }
}

resource "aws_ecr_repository" "takeon-dev-pl-repo" {
  name = "takeon-dev-pl"
  tags = {
      Name = "takeon-dev-pl-repo"
      App = "takeon-dev-pl-repo"
  }
}

resource "aws_ecr_repository" "takeon-dev-vpl-repo" {
  name = "takeon-dev-vpl"
  tags = {
      Name = "takeon-dev-vpl-repo"
      App = "takeon-dev-vpl-repo"
  }
}