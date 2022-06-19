locals {
  path = "./resources"

  lambda = {
    path    = "${local.path}/lambda"
    runtime = "python3.9"

    functions = {
      testDB = {
        filename      = "db_test.zip"
        handler       = "db_test.main_handler"
        api_call      = "dbtest"
        method        = "GET"
        authorization = "NONE"
      }
    }

  }

  s3 = {
    main_website = {
      bucket_name = "cloud-vending-machine"
      tier        = "STANDARD"
      path        = "./resources/main_website"

      index_document = "index.html"
      error_document = "html/error.html"
    }

    stock_website = {
      bucket_name = "cloud-vending-machine-stock"
      tier        = "STANDARD"
      path        = "./resources/stock_website"

      index_document = "index.html"
      error_document = "error.html"
    }

  }
}