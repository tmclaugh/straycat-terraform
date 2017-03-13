/*
* aws vars for Terraform
*/
terragrunt = {
  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"
    config {
      encrypt = "true"
      bucket  = "straycat-dhs-org-straycat-terraform"
      key     = "root.tfstate"
      region  = "us-east-1"
    }
  }
}

# WARNING: Must be aligned with terragrunt setup.
# NOTE: tf_straycat_svc takes care of the
# {var.aws_s3_prefix}-{var.aws_account} in the bucket name.
terraform_state_bucket = "terraform"

aws_profile       = "straycat"          # AWS credentials profile name
aws_account       = "straycat"          # AWS account name
aws_account_id    = ""                  # AWS account ID
domain            = "straycat.dhs.org"  # domain name
aws_s3_prefix     = "straycat-dhs-org"  # we prefix S3 buckets with this

