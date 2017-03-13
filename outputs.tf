output "domain" {
  value = "${var.domain}"
}

output "aws_account" {
  value = "${var.aws_account}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "aws_s3_prefix" {
  value = "${var.aws_s3_prefix}"
}

output "aws_availability_zones" {
  value = ["${var.aws_availability_zones}"]
}

output "aws_s3_bucket_terraform_state_logs_bucket_id" {
  value = "${module.aws_s3_bucket_terraform_state_logs.bucket_id}"
}

output "aws_s3_terraform_state_logs_bucket_bucket_arn" {
  value = "${module.aws_s3_bucket_terraform_state_logs.bucket_arn}"
}

output "aws_s3_bucket_terraform_state_bucket_id" {
  value = "${aws_s3_bucket.aws_s3_bucket_terraform_state.bucket_id}"
}

output "aws_s3_bucket_terraform_state_bucket_arn" {
  value = "${aws_s3_bucket.aws_s3_bucket_terraform_state.bucket_arn}"
}

output "aws_s3_bucket_infra_logs_bucket_id" {
  value = "${module.aws_s3_bucket_infra_logs.bucket_id}"
}

output "aws_s3_bucket_infra_logs_bucket_arn" {
  value = "${module.aws_s3_bucket_infra_logs.bucket_arn}"
}

