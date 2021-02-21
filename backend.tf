# Backend with shared state
terraform {
  backend "s3" {
    bucket = "training-terraform"
    key    = "tf_state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "training-terraform" {
  bucket = "training-terraform"
  acl    = "private"

  tags = {
    "Name" = "training-terraform"
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# output "s3_bucket_id" {
#     value = aws_s3_bucket.s3_bucket.id
# }
# output "s3_bucket_arn" {
#     value = aws_s3_bucket.s3_bucket.arn
# }
# output "s3_bucket_domain_name" {
#     value = aws_s3_bucket.s3_bucket.bucket_domain_name
# }
# output "s3_hosted_zone_id" {
#     value = aws_s3_bucket.s3_bucket.hosted_zone_id
# }
# output "s3_bucket_region" {
#     value = aws_s3_bucket.s3_bucket.region
# }