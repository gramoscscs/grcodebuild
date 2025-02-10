resource "aws_codebuild_project" "GR-ansible-playbook1" {
  name          = "GR-ansible-test1"
  description   = "GR-ansible-test1"
  build_timeout = "5"

  source {
    type      = "GITHUB"
    location  = "https://github.com/gramoscscs/grcodebuild"
    buildspec = "buildspec.yml"
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
    environment_variable {
      name  = "GR_ANSIBLE_TEST_1_ENV_VAR"
      value = "gr-ansible-test-1-value"
    }
  }

  service_role = aws_iam_role.GR_codebuild_role.arn
}