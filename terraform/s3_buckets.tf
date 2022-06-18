# ---------------------------------------------------------------------------
# Amazon S3 resources
# ---------------------------------------------------------------------------

module "s3" {
    for_each = local.s3
    source   = "./modules/s3_website"


    bucket_name = each.value.bucket_name
    objects     = try(each.value.objects, {})
    resource_path = "./resources/websites"
}

