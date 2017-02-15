// intial AWS setup.
module "aws_s3_bucket_terraform_state_logs" {
  source              = "./modules/aws_logs"
  s3_logs_bucket_name = "${var.domain}-${var.aws_account}-terraform-logs"
}

module "aws_s3_bucket_terraform_state" {
  source         = "./modules/aws_s3"
  s3_bucket_name = "${var.terraform_state_bucket}"
  s3_logs_bucket = "${module.aws_s3_bucket_terraform_state_logs.bucket_id}"
  versioning     = "true"
}

