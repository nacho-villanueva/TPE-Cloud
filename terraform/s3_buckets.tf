# ---------------------------------------------------------------------------
# Amazon S3 resources
# ---------------------------------------------------------------------------

module "s3_main_website" {
    source   = "./modules/s3_website"


    bucket_name = local.s3.main_website.bucket_name
    export_path = local.s3.main_website.path

    index_document = local.s3.main_website.index_document
    error_document = local.s3.main_website.error_document
}

module "s3_stock_website" {
    source   = "./modules/s3_website"


    bucket_name = local.s3.stock_website.bucket_name
    export_path = local.s3.stock_website.path

    index_document = local.s3.stock_website.index_document
    error_document = local.s3.stock_website.error_document
}


