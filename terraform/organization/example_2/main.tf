# ---------------------------------------------------------------------------
# Main resources - adding a for_each and variables
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "this" {
    bucket = var.bucket_name
    acl    = "public-read"
    policy = file("${var.path}/policy.json")

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

resource "aws_s3_bucket_object" "html" {
    for_each     = toset(["index.html", "error.html"])
    
    key          = each.key
    bucket       = aws_s3_bucket.this.id
    source       = "${var.path}/static website/${each.key}"
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "images" {
    for_each = toset(["image1.png", "image2.png"])

    key      = each.key
    bucket   = aws_s3_bucket.this.id
    source   = "${var.path}/images/${each.key}"
}