resource "aws_iam_role_policy" "demo_policy" {
  name = "demo_policy"
  role = "${aws_iam_role.iam_role.id}"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("demo-policy.json")}"
}

resource "aws_iam_role" "iam_role" {
  name = "iam_role"

  assume_role_policy = "${file("ec2-assume-policy.json")}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "iam_ec2_profile"
  role = "${aws_iam_role.iam_role.name}"
}
