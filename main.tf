// intial AWS setup.

// Terraform state bucket
module "aws_s3_bucket_terraform_state_logs" {
  source              = "./modules/aws_logs"
  s3_logs_bucket_name = "${var.domain}-${var.aws_account}-terraform-logs"
}

module "aws_s3_bucket_terraform_state" {
  source         = "github.com/tmclaugh/tf_straycat_aws_s3"
  s3_bucket_name = "${var.terraform_state_bucket}"
  s3_logs_bucket = "${module.aws_s3_bucket_terraform_state_logs.bucket_id}"
  versioning     = "true"
  aws_account    = "${var.aws_account}"
  aws_region     = "${var.aws_region}"
}

// We'll use this bucket to store logs from our infrastructure, ex. S3 access
// logs.
module "aws_s3_bucket_infra_logs" {
  source              = "./modules/aws_logs"
  s3_logs_bucket_name = "${var.domain}-${var.aws_account}-infra-logs"
}

