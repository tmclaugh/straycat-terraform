// intial AWS setup.

// Terraform state bucket
module "aws_s3_bucket_terraform_state_logs" {
  source              = "./modules/aws_logs"
  s3_logs_bucket_name = "${var.aws_s3_prefix}-${var.aws_account}-terraform-logs"
}

# NOTE: We can't use out S3 module because we have a cyclic dependency issue.
resource "aws_s3_bucket" "aws_s3_bucket_terraform_state" {
  bucket = "${var.aws_s3_prefix}-${var.aws_account}-${var.terraform_state_bucket}"
  acl    = "private"

  versioning = {
    enabled = true
  }

  logging = {
    target_bucket = "${module.aws_s3_bucket_terraform_state_logs.bucket_id}"
    target_prefix = "s3/${var.aws_s3_prefix}-${var.aws_account}-${var.terraform_state_bucket}/"
  }

  tags = {
    terraform = "true"
  }
}

// We'll use this bucket to store logs from our infrastructure, ex. S3 access
// logs.
module "aws_s3_bucket_infra_logs" {
  source              = "./modules/aws_logs"
  s3_logs_bucket_name = "${var.aws_s3_prefix}-${var.aws_account}-infra-logs"
}

