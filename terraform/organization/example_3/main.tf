# ------------------------------------------------------------------------------
# Main resources -- adding locals and datasources, splitting up resources
# ------------------------------------------------------------------------------

# 1 - S3 bucket
resource "aws_s3_bucket" "this" {
    provider = aws.aws

    bucket              = local.s3.bucket_name
    object_lock_enabled = false
}

# 2 -Bucket policy
resource "aws_s3_bucket_policy" "this" {
    provider = aws.aws

    bucket = aws_s3_bucket.this.id
    policy = data.aws_iam_policy_document.this.json
}

# 3 -Website configuration
resource "aws_s3_bucket_website_configuration" "this" {
    provider = aws.aws

    bucket = aws_s3_bucket.this.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

# 4 - Access Control List
resource "aws_s3_bucket_acl" "this" {
    provider = aws.aws

    bucket = aws_s3_bucket.this.id
    acl    = "public-read"
}

# 5 - Upload objects
resource "aws_s3_object" "this" {
    for_each = local.s3.objects
    provider = aws.aws

    bucket        = aws_s3_bucket.this.id
    key           = replace(each.value.filename, "html/", "") # remote path
    source        = format("../../resources/%s", each.value.filename) # where is the file located
    content_type  = each.value.content_type
    storage_class = try(each.value.tier, "STANDARD")
}